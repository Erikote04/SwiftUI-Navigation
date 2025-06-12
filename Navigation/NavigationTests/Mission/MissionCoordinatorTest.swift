//
//  MissionCoordinatorTest.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 4/6/25.
//

import SwiftUI
import Testing
@testable import Navigation

@Suite("MissionCoordinator", .tags(.coordinator, .missionCoordinator))
struct MissionCoordinatorTest {
    
    private let injector = MissionInjectorMock()
    
    @Test("Can handle known views", arguments: [
        AppView.missions,
        AppView.missionDetail(Mission.sample),
        AppView.astronautDetail(Astronaut.sample)
    ])
    func canHandleKnownViews(view: AppView) {
        let coordinator = MissionCoordinator(injector: injector)
        
        #expect(coordinator.canHandle(view: view) == true)
    }
    
    @Test("Can't handle unknown views", arguments: [
        AppView.astronauts,
        AppView.login,
        AppView.register,
        AppView.tabBar
    ])
    func cantHandleUnknownViews(view: AppView) {
        let coordinator = MissionCoordinator(injector: injector)
        
        #expect(coordinator.canHandle(view: view) == false)
    }
    
    @Test("Builds missions view")
    func buildsMissionsView() {
        let coordinator = MissionCoordinator(injector: injector)
        let _ = coordinator.build(.missions)
        
        #expect(injector.injectMissionCallCount == 1)
    }
    
    @Test("Builds mission detail view")
    func buildsMissionDetailView() {
        let coordinator = MissionCoordinator(injector: injector)
        let _ = coordinator.build(.missionDetail(.sample))
        
        #expect(injector.injectMissionDetailCallCount == 1)
        #expect(injector.mission != nil)
    }
    
    @Test("Builds astronaut detail view")
    func buildsAstronautDetailView() {
        let coordinator = MissionCoordinator(injector: injector)
        let _ = coordinator.build(.astronautDetail(.sample))
        
        #expect(injector.injectAstronautDetailCallCount == 1)
        #expect(injector.astronaut != nil)
    }
    
    @Test("Build unknown view doesn't call builder", arguments: [
        AppView.astronauts,
        AppView.login,
        AppView.register,
        AppView.tabBar,
    ])
    func buildUnknownDoesntCallBuilder(view: AppView) {
        let coordinator = MissionCoordinator(injector: injector)
        let _ = coordinator.build(view)
        
        #expect(injector.injectMissionCallCount == 0)
        #expect(injector.injectMissionDetailCallCount == 0)
        #expect(injector.injectAstronautDetailCallCount == 0)
    }
    
    @Test("Push known view updates path", arguments: [
        AppView.missions,
        AppView.missionDetail(Mission.sample),
        AppView.astronautDetail(Astronaut.sample),
    ])
    func pushKnownViewUpdatesPath(view: AppView) {
        let coordinator = MissionCoordinator(injector: injector)
        let initialCount = coordinator.path.count
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == initialCount + 1)
    }
    
    @Test("Push unknown view doesn't updates path", arguments: [
        AppView.astronauts,
        AppView.login,
        AppView.register,
        AppView.tabBar,
    ])
    func pushUnknownViewDoesntUpdatesPath(view: AppView) {
        let coordinator = MissionCoordinator(injector: injector)
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop view decreases path count")
    func popViewDecreasesPathCount() {
        let coordinator = MissionCoordinator(injector: injector)
        
        coordinator.push(.missions)
        #expect(coordinator.path.count == 1)
        
        coordinator.pop()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop on empty path does nothing")
    func popOnEmptyPathDoesNothing() {
        let coordinator = MissionCoordinator(injector: injector)
        
        coordinator.pop()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root clears path")
    func popToRootClearsPath() {
        let coordinator = MissionCoordinator(injector: injector)
        
        coordinator.push(.missions)
        #expect(coordinator.path.count == 1)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root on empty path does nothing")
    func popToRootOnEmptyPathDoesNothing() {
        let coordinator = MissionCoordinator(injector: injector)
        
        coordinator.popToRoot()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Navigation flow works")
    func navigationFlowWorks() {
        let coordinator = MissionCoordinator(injector: injector)

        coordinator.push(.missions)
        #expect(coordinator.path.count == 1)
        
        coordinator.push(.missionDetail(Mission.sample))
        #expect(coordinator.path.count == 2)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
}
