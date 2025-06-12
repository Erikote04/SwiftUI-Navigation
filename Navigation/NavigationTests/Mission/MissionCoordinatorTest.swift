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
    
    private let builder = MissionBuilderMock()
    
    @Test("Can handle known views", arguments: [
        AppView.missions,
        AppView.missionDetail(Mission.sample),
        AppView.astronautDetail(Astronaut.sample)
    ])
    func canHandleKnownViews(view: AppView) {
        let coordinator = MissionCoordinator(builder: builder)
        
        #expect(coordinator.canHandle(view: view) == true)
    }
    
    @Test("Can't handle unknown views", arguments: [
        AppView.astronauts,
        AppView.login,
        AppView.register,
        AppView.tabBar
    ])
    func cantHandleUnknownViews(view: AppView) {
        let coordinator = MissionCoordinator(builder: builder)
        
        #expect(coordinator.canHandle(view: view) == false)
    }
    
    @Test("Builds missions view")
    func buildsMissionsView() {
        let coordinator = MissionCoordinator(builder: builder)
        let _ = coordinator.build(.missions)
        
        #expect(builder.buildMissionCallCount == 1)
    }
    
    @Test("Builds mission detail view")
    func buildsMissionDetailView() {
        let coordinator = MissionCoordinator(builder: builder)
        let _ = coordinator.build(.missionDetail(.sample))
        
        #expect(builder.buildMissionDetailCallCount == 1)
    }
    
    @Test("Builds astronaut detail view")
    func buildsAstronautDetailView() {
        let coordinator = MissionCoordinator(builder: builder)
        let _ = coordinator.build(.astronautDetail(.sample))
        
        #expect(builder.buildAstronautDetailCallCount == 1)
    }
    
    @Test("Build unknown view doesn't call builder", arguments: [
        AppView.astronauts,
        AppView.login,
        AppView.register,
        AppView.tabBar,
    ])
    func buildUnknownDoesntCallBuilder(view: AppView) {
        let coordinator = MissionCoordinator(builder: builder)
        let _ = coordinator.build(view)
        
        #expect(builder.buildMissionCallCount == 0)
        #expect(builder.buildMissionDetailCallCount == 0)
        #expect(builder.buildAstronautDetailCallCount == 0)
    }
    
    @Test("Push known view updates path", arguments: [
        AppView.missions,
        AppView.missionDetail(Mission.sample),
        AppView.astronautDetail(Astronaut.sample),
    ])
    func pushKnownViewUpdatesPath(view: AppView) {
        let coordinator = MissionCoordinator(builder: builder)
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
        let coordinator = MissionCoordinator(builder: builder)
        
        coordinator.push(view)
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop view decreases path count")
    func popViewDecreasesPathCount() {
        let coordinator = MissionCoordinator(builder: builder)
        
        coordinator.push(.missions)
        #expect(coordinator.path.count == 1)
        
        coordinator.pop()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop on empty path does nothing")
    func popOnEmptyPathDoesNothing() {
        let coordinator = MissionCoordinator(builder: builder)
        
        coordinator.pop()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root clears path")
    func popToRootClearsPath() {
        let coordinator = MissionCoordinator(builder: builder)
        
        coordinator.push(.missions)
        #expect(coordinator.path.count == 1)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Pop to root on empty path does nothing")
    func popToRootOnEmptyPathDoesNothing() {
        let coordinator = MissionCoordinator(builder: builder)
        
        coordinator.popToRoot()
        
        #expect(coordinator.path.count == 0)
    }
    
    @Test("Navigation flow works")
    func navigationFlowWorks() {
        let coordinator = MissionCoordinator(builder: builder)

        coordinator.push(.missions)
        #expect(coordinator.path.count == 1)
        
        coordinator.push(.missionDetail(Mission.sample))
        #expect(coordinator.path.count == 2)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
}
