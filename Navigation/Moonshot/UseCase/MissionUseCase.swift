import Foundation

protocol MissionUseCaseProtocol: UseCaseProtocol {
    func getMissions() async throws -> [Mission]
}

class MissionUseCase: MissionUseCaseProtocol {
    func getMissions() async throws -> [Mission] {
        return try await withCheckedThrowingContinuation { continuation in
            let missions: [Mission] = Bundle.main.decode("missions.json")
            continuation.resume(returning: missions)
        }
    }
}
