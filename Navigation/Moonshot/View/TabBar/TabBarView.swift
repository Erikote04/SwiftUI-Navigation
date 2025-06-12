import SwiftUI

struct TabBarView: View {
    @ObservedObject var coordinator: TabBarCoordinator
    @ObservedObject var missionCoordinator: MissionCoordinator
    @ObservedObject var astronautCoordinator: AstronautCoordinator
    @ObservedObject var loginCoordinator: LoginCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            ForEach(self.coordinator.tabs, id: \.self) { tabItem in
                switch tabItem {
                case .missions: missionsView(tabItem)
                case .astronauts: astronautsView(tabItem)
                case .login: loginView(tabItem)
                }
            }
        }
        .tint(.white)
    }
}

private extension TabBarView {
    @ViewBuilder func missionsView(_ tabItem: TabItem) -> some View {
        NavigationStack(path: $missionCoordinator.path) {
            missionCoordinator.build(.missions)
                .navigationDestination(for: AppView.self) { view in
                    missionCoordinator.build(view)
                }
        }
        .tabItem { Label(tabItem.title, systemImage: "flag.pattern.checkered") }
        .tag(tabItem)
    }
    
    @ViewBuilder func astronautsView(_ tabItem: TabItem) -> some View {
        NavigationStack(path: $astronautCoordinator.path) {
            astronautCoordinator.build(.astronauts)
                .navigationDestination(for: AppView.self) { view in
                    astronautCoordinator.build(view)
                }
        }
        .tabItem { Label(tabItem.title, systemImage: "person.3.fill") }
        .tag(tabItem)
    }
    
    @ViewBuilder func loginView(_ tabItem: TabItem) -> some View {
        NavigationStack(path: $loginCoordinator.path) {
            loginCoordinator.build(.login)
                .navigationDestination(for: AppView.self) { view in
                    loginCoordinator.build(view)
                }
                .sheet(item: $loginCoordinator.sheet) { sheet in
                    loginCoordinator.build(sheet)
                }
                .fullScreenCover(item: $loginCoordinator.fullScreenCover) { fullScreenCover in
                    loginCoordinator.build(fullScreenCover)
                }
        }
        .tabItem { Label(tabItem.title, systemImage: "person.circle.fill") }
        .tag(tabItem)
    }
}
