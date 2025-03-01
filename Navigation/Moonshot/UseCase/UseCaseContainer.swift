import Foundation

final class UseCaseContainer {
    static let shared = UseCaseContainer()
    
    private lazy var astronautUseCase: AstronautUseCaseProtocol = AstronautUseCase()
    private lazy var missionUseCase: MissionUseCaseProtocol = MissionUseCase()
    
    private init() {}
    
    func getAstronautUseCase() -> AstronautUseCaseProtocol {
        return astronautUseCase
    }
    
    func getMissionUseCase() -> MissionUseCaseProtocol {
        return missionUseCase
    }
}
