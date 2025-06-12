//
//  LoginCoordinatorTest.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 12/6/25.
//

import Testing
@testable import Navigation

@Suite("LoginCoordinator", .tags(.coordinator, .loginCoordinator))
struct LoginCoordinatorTest {

    private let injector = LoginInjectorMock()
    
    @Test("Can handle known views", arguments: [
        AppView.login,
        AppView.register
    ])
    func canHandleKnownViews(view: AppView) {
        let coordinator = LoginCoordinator(injector: injector)
        #expect(coordinator.canHandle(view: view) == true)
    }
    
    @Test("Can't handle unknown views", arguments: [
        AppView.astronauts,
        AppView.astronautDetail(Astronaut.sample),
        AppView.missions,
        AppView.missionDetail(Mission.sample),
        AppView.tabBar,
    ])
    func cantHandleUnknownViews(view: AppView) {
        let coordinator = LoginCoordinator(injector: injector)
        #expect(coordinator.canHandle(view: view) == false)
    }
    
    @Test("Builds login view")
    func buildsLoginView() {
        let coordinator = LoginCoordinator(injector: injector)
        let _ = coordinator.build(.login)
        
        #expect(injector.buildLoginCallCount == 1)
    }

    @Test("Builds register view")
    func buildsRegisterView() {
        let coordinator = LoginCoordinator(injector: injector)
        let _ = coordinator.build(.register)
        
        #expect(injector.buildRegisterCallCount == 1)
    }
    
    @Test("Builds forgot password view")
    func buildsForgotPasswordView() {
        let coordinator = LoginCoordinator(injector: injector)
        let _ = coordinator.build(.forgotPassword)
        
        #expect(injector.presentSheetCallCount == 1)
    }
    
    @Test("Builds terms and conditions view")
    func buildsTermsAndConditionsView() {
        let coordinator = LoginCoordinator(injector: injector)
        let _ = coordinator.build(.termsAndConditions)
        
        #expect(injector.presentFullScreenCoverCallCount == 1)
    }
    
    @Test("Presents and dismisses sheet")
    func presentsAndDismissesSheet() {
        let coordinator = LoginCoordinator(injector: injector)
        
        #expect(coordinator.sheet == nil)
        
        coordinator.presentSheet(.forgotPassword)
        #expect(coordinator.sheet == .forgotPassword)
        
        coordinator.dismissSheet()
        #expect(coordinator.sheet == nil)
    }
    
    @Test("Presents and dismisses full screen cover")
    func presentsAndDismissesFullScreenCover() {
        let coordinator = LoginCoordinator(injector: injector)
        
        #expect(coordinator.fullScreenCover == nil)
        
        coordinator.presentFullScreenCover(.termsAndConditions)
        #expect(coordinator.fullScreenCover == .termsAndConditions)
        
        coordinator.dismissFullScreenCover()
        #expect(coordinator.fullScreenCover == nil)
    }
    
    @Test("Build unknown view doesn't call builder", arguments: [
        AppView.astronauts,
        AppView.astronautDetail(Astronaut.sample),
        AppView.missions,
        AppView.missionDetail(Mission.sample),
        AppView.tabBar,
    ])
    func buildUnknownViewDoesntCallBuilder(view: AppView) {
        let coordinator = LoginCoordinator(injector: injector)
        let _ = coordinator.build(view)
        
        #expect(injector.buildLoginCallCount == 0)
        #expect(injector.buildRegisterCallCount == 0)
    }
    
    @Test("Push known view updates path", arguments: [
        AppView.login,
        AppView.register
    ])
    func pushKnownViewUpdatesPath(view: AppView) {
        let coordinator = LoginCoordinator(injector: injector)
        let initialCount = coordinator.path.count
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == initialCount + 1)
    }
    
    @Test("Push unknown view does't update path", arguments: [
        AppView.astronauts,
        AppView.astronautDetail(Astronaut.sample),
        AppView.missions,
        AppView.missionDetail(Mission.sample),
        AppView.tabBar,
    ])
    func pushUnknownViewDoesntUpdatePath(view: AppView) {
        let coordinator = LoginCoordinator(injector: injector)
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop view decreases path count")
    func popViewDecreasesPathCount() {
        let coordinator = LoginCoordinator(injector: injector)
        
        coordinator.push(.register)
        #expect(coordinator.path.count == 1)
        
        coordinator.pop()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop on empty path does nothing")
    func popOnEmptyPathDoesNothing() {
        let coordinator = LoginCoordinator(injector: injector)
        
        coordinator.pop()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root clears path")
    func popToRootClearsPath() {
        let coordinator = LoginCoordinator(injector: injector)
        
        coordinator.push(.register)
        #expect(coordinator.path.count == 1)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root dissmisses sheet")
    func popToRootDismissesSheet() {
        let coordinator = LoginCoordinator(injector: injector)
        
        coordinator.presentSheet(.forgotPassword)
        #expect(coordinator.sheet == .forgotPassword)
        
        coordinator.popToRoot()
        #expect(coordinator.sheet == nil)
    }
    
    @Test("Pop to root dismisses full screen cover")
    func popToRootDismissesFullScreenCover() {
        let coordinator = LoginCoordinator(injector: injector)
        
        coordinator.presentFullScreenCover(.termsAndConditions)
        #expect(coordinator.fullScreenCover == .termsAndConditions)
        
        coordinator.popToRoot()
        #expect(coordinator.fullScreenCover == nil)
    }
    
    @Test("Pop to root on empty path does nothing")
    func popToRootOnEmptyPathDoesNothing() {
        let coordinator = LoginCoordinator(injector: injector)
        
        coordinator.popToRoot()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Navigation flow works")
    func navigationFlowWorks() {
        let coordinator = LoginCoordinator(injector: injector)
        
        _ = coordinator.build(.login)
        #expect(coordinator.path.count == 0)
        
        coordinator.push(.register)
        #expect(coordinator.path.count == 1)
        
        coordinator.pop()
        #expect(coordinator.path.count == 0)
        
        coordinator.presentSheet(.forgotPassword)
        #expect(coordinator.sheet == .forgotPassword)
        
        coordinator.dismissSheet()
        #expect(coordinator.sheet == nil)
        
        coordinator.presentFullScreenCover(.termsAndConditions)
        #expect(coordinator.fullScreenCover == .termsAndConditions)
        
        coordinator.dismissFullScreenCover()
        #expect(coordinator.fullScreenCover == nil)
        
        coordinator.push(.register)
        #expect(coordinator.path.count == 1)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
}
