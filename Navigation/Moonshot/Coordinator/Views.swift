import SwiftUI

enum AppView: Identifiable, Hashable {
    var id: Self { self }
    case missions
    case missionDetail(_ mission: Mission)
    case astronauts
    case astronautDetail(_ astronaut: Astronaut)
}

/// enum Sheet: Identifiable, Hashable {
///     var id: Self { self }
/// }

/// enum FullScreenCover: Identifiable, Hashable {
///     var id: Self { self }
/// }
