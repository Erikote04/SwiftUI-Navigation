import Foundation

protocol AstronautUseCaseProtocol: UseCaseProtocol {
    func getAstronauts() async throws -> [String: Astronaut]
}

class AstronautUseCase: AstronautUseCaseProtocol {
    func getAstronauts() async throws -> [String: Astronaut] {
        return try await withCheckedThrowingContinuation { continuation in
            let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
            continuation.resume(returning: astronauts)
        }
    }
}
