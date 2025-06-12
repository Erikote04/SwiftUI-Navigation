import SwiftUI

protocol AstronautBuilderProtocol {
    func build(with coordinator: AstronautCoordinator) -> AnyView
    func buildAstronautDetail(for astronaut: Astronaut) -> AnyView
}

final class AstronautBuilder: AstronautBuilderProtocol {
    
    private let useCase: AstronautUseCaseProtocol
    
    init(useCase: AstronautUseCaseProtocol) {
        self.useCase = useCase
    }
    
    private(set) lazy var viewModel: AstronautViewModel = {
        AstronautViewModel(astronautsUseCase: useCase)
    }()
    
    func build(with coordinator: AstronautCoordinator) -> AnyView {
        AnyView(AstronautsView(coordinator: coordinator, viewModel: viewModel))
    }
    
    func buildAstronautDetail(for astronaut: Astronaut) -> AnyView {
        AnyView(AstronautDetailView(astronaut: astronaut))
    }
}
