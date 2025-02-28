//
//  MissionUseCase.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 28/2/25.
//

import Foundation

protocol MissionUseCaseProtocol {
    func getMissions() -> [Mission]
}

class MissionUseCase: MissionUseCaseProtocol {
    func getMissions() -> [Mission] {
        Bundle.main.decode("missions.json")
    }
}
