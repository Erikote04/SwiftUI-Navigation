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

    private let builder = LoginBuilderMock()
    
    @Test("Can handle known views", arguments: [
        AppView.login,
        AppView.register
    ])
    func canHandleKnownViews(view: AppView) {
        let coordinator = LoginCoordinator(builder: builder)
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
        let coordinator = LoginCoordinator(builder: builder)
        #expect(coordinator.canHandle(view: view) == false)
    }
    
    @Test("Builds login view")
    func buildsLoginView() {
        let coordinator = LoginCoordinator(builder: builder)
        let _ = coordinator.build(.login)
        
        #expect(builder.buildLoginCallCount == 1)
    }

    @Test("Builds register view")
    func buildsRegisterView() {
        let coordinator = LoginCoordinator(builder: builder)
        let _ = coordinator.build(.register)
        
        #expect(builder.buildRegisterCallCount == 1)
    }
    
    @Test("Builds forgot password view")
    func buildsForgotPasswordView() {
        let coordinator = LoginCoordinator(builder: builder)
        let _ = coordinator.build(.forgotPassword)
        
        #expect(builder.presentSheetCallCount == 1)
    }
    
    @Test("Builds terms and conditions view")
    func buildsTermsAndConditionsView() {
        let coordinator = LoginCoordinator(builder: builder)
        let _ = coordinator.build(.termsAndConditions)
        
        #expect(builder.presentFullScreenCoverCallCount == 1)
    }
    
    @Test("Presents and dismisses sheet")
    func presentsAndDismissesSheet() {
        let coordinator = LoginCoordinator(builder: builder)
        
        #expect(coordinator.sheet == nil)
        
        coordinator.presentSheet(.forgotPassword)
        #expect(coordinator.sheet == .forgotPassword)
        
        coordinator.dismissSheet()
        #expect(coordinator.sheet == nil)
    }
    
    @Test("Presents and dismisses full screen cover")
    func presentsAndDismissesFullScreenCover() {
        let coordinator = LoginCoordinator(builder: builder)
        
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
        let coordinator = LoginCoordinator(builder: builder)
        let _ = coordinator.build(view)
        
        #expect(builder.buildLoginCallCount == 0)
        #expect(builder.buildRegisterCallCount == 0)
    }
    
    @Test("Push known view updates path", arguments: [
        AppView.login,
        AppView.register
    ])
    func pushKnownViewUpdatesPath(view: AppView) {
        let coordinator = LoginCoordinator(builder: builder)
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
        let coordinator = LoginCoordinator(builder: builder)
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop view decreases path count")
    func popViewDecreasesPathCount() {
        let coordinator = LoginCoordinator(builder: builder)
        
        coordinator.push(.register)
        #expect(coordinator.path.count == 1)
        
        coordinator.pop()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop on empty path does nothing")
    func popOnEmptyPathDoesNothing() {
        let coordinator = LoginCoordinator(builder: builder)
        
        coordinator.pop()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root clears path")
    func popToRootClearsPath() {
        let coordinator = LoginCoordinator(builder: builder)
        
        coordinator.push(.register)
        #expect(coordinator.path.count == 1)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root dissmisses sheet")
    func popToRootDismissesSheet() {
        let coordinator = LoginCoordinator(builder: builder)
        
        coordinator.presentSheet(.forgotPassword)
        #expect(coordinator.sheet == .forgotPassword)
        
        coordinator.popToRoot()
        #expect(coordinator.sheet == nil)
    }
    
    @Test("Pop to root dismisses full screen cover")
    func popToRootDismissesFullScreenCover() {
        let coordinator = LoginCoordinator(builder: builder)
        
        coordinator.presentFullScreenCover(.termsAndConditions)
        #expect(coordinator.fullScreenCover == .termsAndConditions)
        
        coordinator.popToRoot()
        #expect(coordinator.fullScreenCover == nil)
    }
    
    @Test("Pop to root on empty path does nothing")
    func popToRootOnEmptyPathDoesNothing() {
        let coordinator = LoginCoordinator(builder: builder)
        
        coordinator.popToRoot()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Navigation flow works")
    func navigationFlowWorks() {
        let coordinator = LoginCoordinator(builder: builder)
        
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
