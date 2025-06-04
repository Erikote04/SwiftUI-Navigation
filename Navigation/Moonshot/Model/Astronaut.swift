import SwiftUI

struct Astronaut: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let description: String
}

extension Astronaut: Equatable {
    static func == (lhs: Astronaut, rhs: Astronaut) -> Bool {
        lhs.id == rhs.id
    }
}
