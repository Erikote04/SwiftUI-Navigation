//
//  Views.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 28/2/25.
//

import Foundation

enum AppView: Hashable {
    case missions
    case missionDetail(mission: Mission)
    case astronauts
    case astronautDetail(astronaut: Astronaut)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .missions:
            hasher.combine(0)
        case .missionDetail(let mission):
            hasher.combine(1)
            hasher.combine(mission.id)
        case .astronauts:
            hasher.combine(2)
        case .astronautDetail(let astronaut):
            hasher.combine(3)
            hasher.combine(astronaut.id)
        }
    }
    
    static func == (lhs: AppView, rhs: AppView) -> Bool {
        switch (lhs, rhs) {
        case (.missions, .missions):
            return true
        case (.missionDetail(let mission1), .missionDetail(let mission2)):
            return mission1.id == mission2.id
        case (.astronauts, .astronauts):
            return true
        case (.astronautDetail(let astronaut1), .astronautDetail(let astronaut2)):
            return astronaut1.id == astronaut2.id
        default:
            return false
        }
    }
}

