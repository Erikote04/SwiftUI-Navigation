import SwiftUI

final class TabBarBuilder {
    
    func build(with coordinator: TabBarCoordinator) -> some View {
        TabBarView(
            coordinator: coordinator,
            missionCoordinator: coordinator.getMissionCoordinator(),
            astronautCoordinator: coordinator.getAstronautCoordinator(),
            loginCoordinator: coordinator.getLoginCoordinator()
        )
    }
}
