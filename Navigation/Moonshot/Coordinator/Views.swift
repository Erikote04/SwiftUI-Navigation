import SwiftUI

enum AppView: Identifiable, Hashable {
    var id: Self { self }
    
    case tabBar
    
    case missions
    case missionDetail(_ mission: Mission)
    
    case astronauts
    case astronautDetail(_ astronaut: Astronaut)
    
    case login
    case register
}

enum Sheet: Identifiable, Hashable {
    var id: Self { self }
    
    case forgotPassword
}

enum FullScreenCover: Identifiable, Hashable {
    var id: Self { self }
    
    case termsAndConditions
}
