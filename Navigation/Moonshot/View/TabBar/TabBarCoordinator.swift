import SwiftUI

enum TabItem {
    case missions
    case astronauts
    case login
    
    var title: String {
        switch self {
        case .missions: return "Missions"
        case .astronauts: return "Astronauts"
        case .login: return "Login"
        }
    }
}

final class TabBarCoordinator: BaseCoordinator {
    @Published var selectedTab: TabItem = .missions
    
    let tabs: [TabItem] = [.missions, .astronauts, .login]
    
    private let injector: TabBarInjector = TabBarInjector()
    
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
        case .tabBar: injector.inject(coordinator: self, in: view)
        default: EmptyView()
        }
    }
}
