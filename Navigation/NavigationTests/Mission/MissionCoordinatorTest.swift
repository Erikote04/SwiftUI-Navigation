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
        AppView.missionDetail(Mission.firstSampleMission),
        AppView.astronautDetail(Astronaut.firstSampleAstronaut)
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
    
    @Test("Build missions view")
    func buildMissionsView() {
        let coordinator = MissionCoordinator(builder: builder)
        let _ = coordinator.build(.missions)
        
        #expect(builder.buildMissionCallCount == 1)
    }
    
    @Test("Build mission detail view")
    func buildMissionDetailView() {
        let coordinator = MissionCoordinator(builder: builder)
        let _ = coordinator.build(.missionDetail(.firstSampleMission))
        
        #expect(builder.buildMissionDetailCallCount == 1)
    }
    
    @Test("Build astronaut detail view")
    func buildAstronautDetailView() {
        let coordinator = MissionCoordinator(builder: builder)
        let _ = coordinator.build(.astronautDetail(.firstSampleAstronaut))
        
        #expect(builder.buildAstronautDetailCallCount == 1)
    }
    
    @Test("Build unknown view doesn't call builder")
    func buildUnknownDoesntCallBuilder() {
        #expect(builder.buildMissionCallCount == 0)
        #expect(builder.buildMissionDetailCallCount == 0)
        #expect(builder.buildAstronautDetailCallCount == 0)
    }
    
    @Test("Push known view updates path")
    func pushKnownViewUpdatesPath() {
        let coordinator = MissionCoordinator(builder: builder)
        let initialCount = coordinator.path.count
        
        coordinator.push(.missions)
        
        #expect(coordinator.path.count == initialCount + 1)
    }
    
    @Test("Push unknown view doesn't updates path")
    func pushUnknownViewDoesntUpdatesPath() {
        let coordinator = MissionCoordinator(builder: builder)
        let initialCount = coordinator.path.count
        
        coordinator.push(.astronauts)
        
        #expect(coordinator.path.count == initialCount)
    }
    
    @Test("Pop view decreases path count")
    func popViewDecreasesPathCount() {
        let coordinator = MissionCoordinator(builder: builder)
        
        coordinator.push(.missions)
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
        coordinator.push(.missionDetail(.firstSampleMission))
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
        
        coordinator.push(.missionDetail(Mission.firstSampleMission))
        #expect(coordinator.path.count == 2)
        
        coordinator.popToRoot()
        #expect(coordinator.path.count == 0)
    }
}
