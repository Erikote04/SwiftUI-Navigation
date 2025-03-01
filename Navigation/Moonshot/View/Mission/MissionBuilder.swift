import SwiftUI

final class MissionBuilder {
    
    private(set) lazy var viewModel: MissionViewModel = {
        MissionViewModel(missionUseCase: UseCaseContainer.shared.getCurrentUseCase(),
                         astronautUseCase: UseCaseContainer.shared.getCurrentUseCase())
    }()
    
    func build(with coordinator: MissionCoordinator) -> some View {
        MissionsView(coordinator: coordinator, viewModel: viewModel)
    }
    
    func buildMissionDetail(with coordinator: MissionCoordinator, for mission: Mission) -> some View {
        MissionDetailView(coordinator: coordinator, viewModel: viewModel, mission: mission)
    }
    
    func buildAstronautDetail(for astronaut: Astronaut) -> some View {
        AstronautDetailView(astronaut: astronaut)
    }
}
