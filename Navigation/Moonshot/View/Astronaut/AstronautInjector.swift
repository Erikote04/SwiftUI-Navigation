import SwiftUI

protocol AstronautInjectorProtocol: BaseInjectorProtocol {
    /*
     Add your specific methods for this protocol if necessary
     */
}

final class AstronautInjector: AstronautInjectorProtocol {
    
    private let useCase: AstronautUseCaseProtocol
    
    init(useCase: AstronautUseCaseProtocol = AstronautUseCase()) {
        self.useCase = useCase
    }
    
    private(set) lazy var viewModel: AstronautViewModel = {
        AstronautViewModel(astronautsUseCase: useCase)
    }()
    
    func inject(coordinator: any BaseCoordinatorProtocol, in view: AppView) -> AnyView {
        guard let coordinator = coordinator as? AstronautCoordinator else {
            fatalError("AstronautInjector requires AstronautCoordinator")
        }
        
        switch view {
        case .astronauts: return AnyView(AstronautsView(coordinator: coordinator, viewModel: viewModel))
        case .astronautDetail(let astronaut): return AnyView(AstronautDetailView(astronaut: astronaut))
        default: fatalError("AstronautInjector - Unsupported view type: \(view)")
        }
    }
}
