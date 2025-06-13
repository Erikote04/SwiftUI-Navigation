import Foundation

protocol MissionUseCaseProtocol {
    func getMissions() async throws -> [Mission]
}

class MissionUseCase: MissionUseCaseProtocol {
    func getMissions() async throws -> [Mission] {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        return missions
    }
}
