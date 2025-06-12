import SwiftUI

protocol TabBarInjectorProtocol: BaseInjectorProtocol {
    /*
     Add your specific methods for this protocol if necessary
     */
}

class TabBarInjector: BaseInjectorProtocol {
    func inject(coordinator: any BaseCoordinatorProtocol, in view: AppView) -> AnyView {
        guard let coordinator = coordinator as? TabBarCoordinator else {
            fatalError("TabBarInjector requires TabBarCoordinator")
        }
        
        switch view {
        case .tabBar: return AnyView(TabBarView(coordinator: coordinator,
                                                missionCoordinator: coordinator.getMissionCoordinator(),
                                                astronautCoordinator: coordinator.getAstronautCoordinator(),
                                                loginCoordinator: coordinator.getLoginCoordinator()))
        default: fatalError("TabBarInjector - Unsupported view type: \(view)")
        }
    }
}
