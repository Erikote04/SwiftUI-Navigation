import SwiftUI

final class AstronautCoordinator: BaseCoordinator {
    
    private let injector: AstronautInjectorProtocol
    
    init(injector: AstronautInjectorProtocol = AstronautInjector()) {
        self.injector = injector
        super.init()
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .astronauts, .astronautDetail(_): true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        injector.inject(coordinator: self, in: view)
    }
}
