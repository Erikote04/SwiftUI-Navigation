import SwiftUI

enum Tab {
    case missions
    case astronauts
    case login
}

final class TabBarCoordinator: BaseCoordinator {
    private let tabBarBuilder: TabBarBuilder = TabBarBuilder()
    
    @Published var selectedTab: Tab = .missions
    
    private lazy var missionCoordinator = MissionCoordinator()
    private lazy var astronautCoordinator = AstronautCoordinator()
    private lazy var loginCoordinator = LoginCoordinator()
    
    func getMissionCoordinator() -> MissionCoordinator {
        return missionCoordinator
    }
    
    func getAstronautCoordinator() -> AstronautCoordinator {
        return astronautCoordinator
    }
    
    func getLoginCoordinator() -> LoginCoordinator {
        return loginCoordinator
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .tabBar: return true
        default: return false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .tabBar: tabBarBuilder.build(with: self)
        default:
            EmptyView()
        }
    }
}
