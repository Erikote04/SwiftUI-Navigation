import Foundation

protocol AstronautUseCaseProtocol: UseCaseProtocol {
    func getAstronauts() -> [String: Astronaut]
}

class AstronautUseCase: AstronautUseCaseProtocol {
    func getAstronauts() -> [String: Astronaut] {
        Bundle.main.decode("astronauts.json")
    }
}
