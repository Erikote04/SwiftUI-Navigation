import SwiftUI

protocol MissionBuilderProtocol {
    func build(with coordinator: MissionCoordinator) -> AnyView
    func buildMissionDetail(with coordinator: MissionCoordinator, for mission: Mission) -> AnyView
    func buildAstronautDetail(for astronaut: Astronaut) -> AnyView
}

final class MissionBuilder: MissionBuilderProtocol {
    
    private let missionUseCase: MissionUseCaseProtocol
    private let astronautUseCase: AstronautUseCaseProtocol
    
    init(missionUseCase: MissionUseCaseProtocol, astronautUseCase: AstronautUseCaseProtocol) {
        self.missionUseCase = missionUseCase
        self.astronautUseCase = astronautUseCase
    }
    
    private(set) lazy var viewModel: MissionViewModel = {
        MissionViewModel(missionUseCase: missionUseCase, astronautUseCase: astronautUseCase)
    }()
    
    func build(with coordinator: MissionCoordinator) -> AnyView {
        AnyView(MissionsView(coordinator: coordinator, viewModel: viewModel))
    }
    
    func buildMissionDetail(with coordinator: MissionCoordinator, for mission: Mission) -> AnyView {
        AnyView(MissionDetailView(coordinator: coordinator, viewModel: viewModel, mission: mission))
    }
    
    func buildAstronautDetail(for astronaut: Astronaut) -> AnyView {
        AnyView(AstronautDetailView(astronaut: astronaut))
    }
}
