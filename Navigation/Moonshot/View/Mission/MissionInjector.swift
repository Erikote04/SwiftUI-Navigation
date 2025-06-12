import SwiftUI

protocol MissionInjectorProtocol {
    func inject(coordinator: MissionCoordinator, in view: AppView) -> AnyView
}

final class MissionInjector: MissionInjectorProtocol {
    
    private let missionUseCase: MissionUseCaseProtocol
    private let astronautUseCase: AstronautUseCaseProtocol
    
    init(missionUseCase: MissionUseCaseProtocol, astronautUseCase: AstronautUseCaseProtocol) {
        self.missionUseCase = missionUseCase
        self.astronautUseCase = astronautUseCase
    }
    
    private(set) lazy var viewModel: MissionViewModel = {
        MissionViewModel(missionUseCase: missionUseCase, astronautUseCase: astronautUseCase)
    }()
    
    func inject(coordinator: MissionCoordinator, in view: AppView) -> AnyView {
        switch view {
        case .missions: AnyView(MissionsView(coordinator: coordinator, viewModel: viewModel))
        case .missionDetail(let mission): AnyView(MissionDetailView(coordinator: coordinator, viewModel: viewModel, mission: mission))
        case .astronautDetail(let astronaut): AnyView(AstronautDetailView(astronaut: astronaut))
        default: fatalError("MissionInjector - Unsupported view type: \(view)")
        }
    }
}
