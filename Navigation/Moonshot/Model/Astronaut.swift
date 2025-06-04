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

extension Astronaut {
    static let firstSampleAstronaut = Astronaut(
        id: "grissom",
        name: "Virgil I. \"Gus\" Grissom",
        description: "Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was one of the seven original National Aeronautics and Space Administration's Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice.\n\nIn addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor."
    )
    
    static let secondSampleAstronaut = Astronaut(
        id: "white",
        name: "Edward H. White II",
        description: "Edward Higgins White II (November 14, 1930 – January 27, 1967) (Lt Col, USAF) was an American aeronautical engineer, U.S. Air Force officer, test pilot, and NASA astronaut. On June 3, 1965, he became the first American to walk in space. White died along with astronauts Virgil \"Gus\" Grissom and Roger B. Chaffee during prelaunch testing for the first crewed Apollo mission at Cape Canaveral.\n\nHe was awarded the NASA Distinguished Service Medal for his flight in Gemini 4 and was then awarded the Congressional Space Medal of Honor posthumously."
    )
}
