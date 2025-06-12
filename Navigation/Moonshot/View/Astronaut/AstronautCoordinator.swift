import SwiftUI

class AstronautCoordinator: BaseCoordinator {
    
    private let injector: AstronautInjectorProtocol
    
    init(injector: AstronautInjectorProtocol) {
        self.injector = injector
        super.init()
    }
    
    convenience override init() {
        let useCase: AstronautUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let injector = AstronautInjector(useCase: useCase)
        
        self.init(injector: injector)
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .astronauts, .astronautDetail(_): true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .astronauts: injector.build(with: self)
        case .astronautDetail(let astronaut): injector.buildAstronautDetail(for: astronaut)
        default: EmptyView()
        }
    }
}
