import SwiftUI

protocol MissionInjectorProtocol: BaseInjectorProtocol {
    /*
     Add your specific methods for this protocol if necessary
     */
}

final class MissionInjector: MissionInjectorProtocol {
    
    private let missionUseCase: MissionUseCaseProtocol
    private let astronautUseCase: AstronautUseCaseProtocol
    
    init(
        missionUseCase: MissionUseCaseProtocol = MissionUseCase(),
        astronautUseCase: AstronautUseCaseProtocol = AstronautUseCase()
    ) {
        self.missionUseCase = missionUseCase
        self.astronautUseCase = astronautUseCase
    }
    
    private(set) lazy var viewModel: MissionViewModel = {
        MissionViewModel(missionUseCase: missionUseCase, astronautUseCase: astronautUseCase)
    }()
    
    func inject(coordinator: any BaseCoordinatorProtocol, in view: AppView) -> AnyView {
        guard let coordinator = coordinator as? MissionCoordinator else {
            fatalError("MissionInjector requires MissionCoordinator")
        }
        
        switch view {
        case .missions: return AnyView(MissionsView(coordinator: coordinator, viewModel: viewModel))
        case .missionDetail(let mission): return AnyView(MissionDetailView(coordinator: coordinator, viewModel: viewModel, mission: mission))
        case .astronautDetail(let astronaut): return AnyView(AstronautDetailView(astronaut: astronaut))
        default: fatalError("MissionInjector - Unsupported view type: \(view)")
        }
    }
}
