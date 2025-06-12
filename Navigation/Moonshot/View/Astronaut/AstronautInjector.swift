import SwiftUI

protocol AstronautInjectorProtocol {
    func inject(coordinator: AstronautCoordinator, for view: AppView) -> AnyView
}

final class AstronautInjector: AstronautInjectorProtocol {
    
    private let useCase: AstronautUseCaseProtocol
    
    init(useCase: AstronautUseCaseProtocol) {
        self.useCase = useCase
    }
    
    private(set) lazy var viewModel: AstronautViewModel = {
        AstronautViewModel(astronautsUseCase: useCase)
    }()
    
    func inject(coordinator: AstronautCoordinator, for view: AppView) -> AnyView {
        switch view {
        case .astronauts: return AnyView(AstronautsView(coordinator: coordinator, viewModel: viewModel))
        case .astronautDetail(let astronaut): return AnyView(AstronautDetailView(astronaut: astronaut))
        default: fatalError("AstronautInjector - Unsupported view type: \(view)")
        }
    }
}
