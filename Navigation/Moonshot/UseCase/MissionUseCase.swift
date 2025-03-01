import Foundation

protocol MissionUseCaseProtocol: UseCaseProtocol {
    func getMissions() -> [Mission]
}

class MissionUseCase: MissionUseCaseProtocol {
    func getMissions() -> [Mission] {
        Bundle.main.decode("missions.json")
    }
}
