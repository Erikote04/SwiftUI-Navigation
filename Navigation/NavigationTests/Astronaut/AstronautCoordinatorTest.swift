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

    private let builder = AstronautBuilderMock()
    
    @Test("Can handle known views", arguments: [
        AppView.astronauts,
        AppView.astronautDetail(Astronaut.sample)
    ])
    func canHandleKnownViews(view: AppView) {
        let coordinator = AstronautCoordinator(builder: builder)
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
        let coordinator = AstronautCoordinator(builder: builder)
        #expect(coordinator.canHandle(view: view) == false)
    }
    
    @Test("Builds astronauts view")
    func buildsAstronautsView() {
        let coordinator = AstronautCoordinator(builder: builder)
        let _ = coordinator.build(.astronauts)
        
        #expect(builder.buildAstronautCallCount == 1)
    }
    
    @Test("Builds astronaut detail view")
    func buildsAstronautDetailView() {
        let coordinator = AstronautCoordinator(builder: builder)
        let _ = coordinator.build(.astronautDetail(Astronaut.sample))
        
        #expect(builder.buildAstronautDetailCallCount == 1)
    }
    
    @Test("Build unknown view doesn't call builder", arguments: [
        AppView.login,
        AppView.missionDetail(Mission.sample),
        AppView.missions,
        AppView.register,
        AppView.tabBar,
    ])
    func buildUnknownViewDoesntCallBuilder(view: AppView) {
        let coordinator = AstronautCoordinator(builder: builder)
        let _ = coordinator.build(view)
        
        #expect(builder.buildAstronautCallCount == 0)
        #expect(builder.buildAstronautDetailCallCount == 0)
    }
    
    @Test("Push known view updates path", arguments: [
        AppView.astronauts,
        AppView.astronautDetail(Astronaut.sample)
    ])
    func pushKnownViewUpdatesPath(view: AppView) {
        let coordinator = AstronautCoordinator(builder: builder)
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
        let coordinator = AstronautCoordinator(builder: builder)
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop view decreases path count")
    func popViewDecreasesPathCount() {
        let coordinator = AstronautCoordinator(builder: builder)
        
        coordinator.push(.astronautDetail(Astronaut.sample))
        #expect(coordinator.path.count == 1)
        
        coordinator.pop()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop on empty path does nothing")
    func popOnEmptyPathDoesNothing() {
        let coordinator = AstronautCoordinator(builder: builder)
        
        coordinator.pop()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root clears path")
    func popToRootClearsPath() {
        let coordinator = AstronautCoordinator(builder: builder)
        
        coordinator.push(.astronauts)
        #expect(coordinator.path.count == 1)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root on empty path does nothing")
    func popToRootOnEmptyPathDoesNothing() {
        let coordinator = AstronautCoordinator(builder: builder)
        
        coordinator.popToRoot()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Navigation flow works")
    func navigationFlowWorks() {
        let coordinator = AstronautCoordinator(builder: builder)
        
        coordinator.push(.astronauts)
        #expect(coordinator.path.count == 1)
        
        coordinator.push(.astronautDetail(.sample))
        #expect(coordinator.path.count == 2)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
}
