import SwiftUI

final class AstronautCoordinator: BaseCoordinator {
    
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
        case .astronauts: injector.inject(coordinator: self, in: view)
        case .astronautDetail(_): injector.inject(coordinator: self, in: view)
        default: EmptyView()
        }
    }
}
