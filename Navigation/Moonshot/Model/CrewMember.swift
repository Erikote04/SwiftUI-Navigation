import SwiftUI

struct CrewMember: Hashable, Identifiable {
    let id: UUID = UUID()
    let role: String
    let astronaut: Astronaut
}
