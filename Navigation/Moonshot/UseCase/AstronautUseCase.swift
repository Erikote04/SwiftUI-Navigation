//
//  AstronautUseCase.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 28/2/25.
//

import Foundation

protocol AstronautUseCaseProtocol {
    func getAstronauts() -> [String: Astronaut]
}

class AstronautUseCase: AstronautUseCaseProtocol {
    func getAstronauts() -> [String: Astronaut] {
        Bundle.main.decode("astronauts.json")
    }
}
