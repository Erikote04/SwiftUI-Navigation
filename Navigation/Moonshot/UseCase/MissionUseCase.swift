import Foundation

protocol MissionUseCaseProtocol {
    func getMissions() -> [Mission]
}

class MissionUseCase: MissionUseCaseProtocol {
    func getMissions() -> [Mission] {
        Bundle.main.decode("missions.json")
    }
}
