import Foundation

protocol AstronautUseCaseProtocol {
    func getAstronauts() async throws -> [String: Astronaut]
}

class AstronautUseCase: AstronautUseCaseProtocol {
    func getAstronauts() async throws -> [String: Astronaut] {
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        return astronauts
    }
}
