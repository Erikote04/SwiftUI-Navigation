import SwiftUI

struct CrewMember: Hashable, Identifiable {
    let id: UUID = UUID()
    let role: String
    let astronaut: Astronaut
}

extension CrewMember: Equatable {
    static func == (lhs: CrewMember, rhs: CrewMember) -> Bool {
        lhs.id == rhs.id
    }
}
