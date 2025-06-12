import SwiftUI
@testable import Navigation

final class AstronautInjectorMock: AstronautInjectorProtocol {
    var injectAstronautCallCount = 0
    var injectAstronautDetailCallCount = 0
    
    var astronaut: Astronaut?
    
    func inject(coordinator: any BaseCoordinatorProtocol, in view: AppView) -> AnyView {
        switch view {
        case .astronauts: injectAstronautCallCount += 1
        case .astronautDetail(let astronaut): injectAstronautDetailCallCount += 1; self.astronaut = astronaut
        default: break
        }
        
        return AnyView(EmptyView())
    }
}
