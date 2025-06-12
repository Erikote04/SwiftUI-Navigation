//
//  MissionBuilderMock.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 4/6/25.
//

import SwiftUI
@testable import Navigation

final class MissionInjectorMock: MissionInjectorProtocol {
    var buildMissionCallCount = 0
    var buildMissionDetailCallCount = 0
    var buildAstronautDetailCallCount = 0
    
    var mission: Mission?
    var astronaut: Astronaut?
    
    func build(with coordinator: MissionCoordinator) -> AnyView {
        buildMissionCallCount += 1
        return AnyView(EmptyView())
    }
    
    func buildMissionDetail(with coordinator: MissionCoordinator, for mission: Mission) -> AnyView {
        buildMissionDetailCallCount += 1
        self.mission = mission
        return AnyView(EmptyView())
    }
    
    func buildAstronautDetail(for astronaut: Astronaut) -> AnyView {
        buildAstronautDetailCallCount += 1
        self.astronaut = astronaut
        return AnyView(EmptyView())
    }
}
