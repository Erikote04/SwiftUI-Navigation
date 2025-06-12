//
//  AstronautCoordinatorTest.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 11/6/25.
//

import Testing
@testable import Navigation

@Suite("AstronautCoordinator", .tags(.coordinator, .astronautCoordinator))
struct AstronautCoordinatorTest {

    private let injector = AstronautInjectorMock()
    
    @Test("Can handle known views", arguments: [
        AppView.astronauts,
        AppView.astronautDetail(Astronaut.sample)
    ])
    func canHandleKnownViews(view: AppView) {
        let coordinator = AstronautCoordinator(injector: injector)
        #expect(coordinator.canHandle(view: view) == true)
    }

    @Test("Can't handle unknown views", arguments: [
        AppView.login,
        AppView.missionDetail(Mission.sample),
        AppView.missions,
        AppView.register,
        AppView.tabBar,
    ])
    func cantHandleUnknownViews(view: AppView) {
        let coordinator = AstronautCoordinator(injector: injector)
        #expect(coordinator.canHandle(view: view) == false)
    }
    
    @Test("Builds astronauts view")
    func buildsAstronautsView() {
        let coordinator = AstronautCoordinator(injector: injector)
        let _ = coordinator.build(.astronauts)
        
        #expect(injector.injectAstronautCallCount == 1)
    }
    
    @Test("Builds astronaut detail view")
    func buildsAstronautDetailView() {
        let coordinator = AstronautCoordinator(injector: injector)
        let _ = coordinator.build(.astronautDetail(Astronaut.sample))
        
        #expect(injector.injectAstronautDetailCallCount == 1)
        #expect(injector.astronaut != nil)
    }
    
    @Test("Build unknown view doesn't call builder", arguments: [
        AppView.login,
        AppView.missionDetail(Mission.sample),
        AppView.missions,
        AppView.register,
        AppView.tabBar,
    ])
    func buildUnknownViewDoesntCallBuilder(view: AppView) {
        let coordinator = AstronautCoordinator(injector: injector)
        let _ = coordinator.build(view)
        
        #expect(injector.injectAstronautCallCount == 0)
        #expect(injector.injectAstronautDetailCallCount == 0)
    }
    
    @Test("Push known view updates path", arguments: [
        AppView.astronauts,
        AppView.astronautDetail(Astronaut.sample)
    ])
    func pushKnownViewUpdatesPath(view: AppView) {
        let coordinator = AstronautCoordinator(injector: injector)
        let initialCount = coordinator.path.count
        
        coordinator.push(.astronautDetail(Astronaut.sample))
        
        #expect(coordinator.path.count == initialCount + 1)
    }
    
    @Test("Push unknown view doesn't update path", arguments: [
        AppView.login,
        AppView.missionDetail(Mission.sample),
        AppView.missions,
        AppView.register,
        AppView.tabBar,
    ])
    func pushUnknownViewDoesntUpdatePath(view: AppView) {
        let coordinator = AstronautCoordinator(injector: injector)
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop view decreases path count")
    func popViewDecreasesPathCount() {
        let coordinator = AstronautCoordinator(injector: injector)
        
        coordinator.push(.astronautDetail(Astronaut.sample))
        #expect(coordinator.path.count == 1)
        
        coordinator.pop()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop on empty path does nothing")
    func popOnEmptyPathDoesNothing() {
        let coordinator = AstronautCoordinator(injector: injector)
        
        coordinator.pop()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root clears path")
    func popToRootClearsPath() {
        let coordinator = AstronautCoordinator(injector: injector)
        
        coordinator.push(.astronauts)
        #expect(coordinator.path.count == 1)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root on empty path does nothing")
    func popToRootOnEmptyPathDoesNothing() {
        let coordinator = AstronautCoordinator(injector: injector)
        
        coordinator.popToRoot()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Navigation flow works")
    func navigationFlowWorks() {
        let coordinator = AstronautCoordinator(injector: injector)
        
        coordinator.push(.astronauts)
        #expect(coordinator.path.count == 1)
        
        coordinator.push(.astronautDetail(.sample))
        #expect(coordinator.path.count == 2)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
}
