//
//  MissionBuilderMock.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 4/6/25.
//

import SwiftUI
@testable import Navigation

final class MissionInjectorMock: MissionInjectorProtocol {
    var injectMissionCallCount = 0
    var injectMissionDetailCallCount = 0
    var injectAstronautDetailCallCount = 0
    
    var mission: Mission?
    var astronaut: Astronaut?
    
    func inject(coordinator: any Navigation.BaseCoordinatorProtocol, in view: Navigation.AppView) -> AnyView {
        switch view {
        case .missions: injectMissionCallCount += 1
        case .missionDetail(let mission): injectMissionDetailCallCount += 1; self.mission = mission
        case .astronautDetail(let astronaut): injectAstronautDetailCallCount += 1; self.astronaut = astronaut
        default: break
        }
        
        return AnyView(EmptyView())
    }
}
