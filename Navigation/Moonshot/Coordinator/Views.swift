//
//  Views.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 28/2/25.
//

import Foundation

enum AppView: Identifiable, Hashable {
    var id: Self { self }
    case missions
    case missionDetail(_ mission: Mission)
    case astronauts
    case astronautDetail(_ astronaut: Astronaut)
}

enum Sheet: Identifiable, Hashable {
    var id: Self { self }
    case imageDetail(_ image: String)
}

enum FullScreenCover: Identifiable, Hashable {
    var id: Self { self }
    case missionDetail(_ mission: Mission)
}
