import SwiftUI

class AstronautCoordinator: BaseCoordinator {
    
    private let builder: AstronautBuilderProtocol
    
    init(builder: AstronautBuilderProtocol) {
        self.builder = builder
        super.init()
    }
    
    convenience override init() {
        let useCase: AstronautUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let builder = AstronautBuilder(useCase: useCase)
        
        self.init(builder: builder)
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .astronauts, .astronautDetail(_): true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .astronauts: builder.build(with: self)
        case .astronautDetail(let astronaut): builder.buildAstronautDetail(for: astronaut)
        default: EmptyView()
        }
    }
}
