import SwiftUI

final class AstronautBuilder {
    
    private(set) lazy var viewModel: AstronautViewModel = {
        AstronautViewModel(astronautsUseCase: UseCaseContainer.shared.getCurrentUseCase())
    }()
    
    func build(with coordinator: AstronautCoordinator) -> some View {
        AstronautsView(coordinator: coordinator, viewModel: viewModel)
    }
    
    func buildAstronautDetail(for astronaut: Astronaut) -> some View {
        AstronautDetailView(astronaut: astronaut)
    }
}
