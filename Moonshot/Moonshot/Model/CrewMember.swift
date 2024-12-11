//
//  CrewMember.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 20/11/24.
//

import Foundation

struct CrewMember: Hashable, Identifiable {
    let id: UUID = UUID()
    let role: String
    let astronaut: Astronaut
}
