import SwiftUI

struct Mission: Codable, Hashable, Identifiable {
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

extension Mission {
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        lhs.id == rhs.id
    }
}

extension Mission {
    static let sample = Mission(
        id: 1,
        launchDate: nil,
        crew: [
            CrewRole(name: "grissom", role: "Comand Pilot"),
            CrewRole(name: "white", role: "Senior Pilot"),
            CrewRole(name: "chaffee", role: "Pilot"),
        ],
        description: "Apollo 1, initially designated AS-204, was the first crewed mission of the United States Apollo program, the project to land the first men on the Moon.\n\nPlanned as the first low Earth orbital test of the Apollo command and service module, to launch on February 21, 1967, the mission never flew; a cabin fire during a launch rehearsal test at Cape Kennedy Air Force Station Launch Complex 34 on January 27 killed all three crew members—Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White, and Pilot Roger B. Chaffee—and destroyed the command module (CM).\n\nThe name Apollo 1, chosen by the crew, was made official by NASA in their honor after the fire."
    )
}
