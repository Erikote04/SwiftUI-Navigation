import SwiftUI

struct TabBarView: View {
    @ObservedObject var coordinator: TabBarCoordinator
    @ObservedObject var missionCoordinator: MissionCoordinator
    @ObservedObject var astronautCoordinator: AstronautCoordinator
    @ObservedObject var loginCoordinator: LoginCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            NavigationStack(path: $missionCoordinator.path) {
                missionCoordinator.build(.missions)
                    .navigationDestination(for: AppView.self) { view in
                        missionCoordinator.build(view)
                    }
            }
            .tag(Tab.missions)
            .tabItem {
                Label("Missions", systemImage: "flag.pattern.checkered")
            }
            
            NavigationStack(path: $astronautCoordinator.path) {
                astronautCoordinator.build(.astronauts)
                    .navigationDestination(for: AppView.self) { view in
                        astronautCoordinator.build(view)
                    }
            }
            .tag(Tab.astronauts)
            .tabItem {
                Label("Astronauts", systemImage: "person.3.fill")
            }
            
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
            .tag(Tab.login)
            .tabItem {
                Label("Login", systemImage: "person.circle.fill")
            }
        }
        .tint(.white)
    }
}

#Preview {
    TabBarView(coordinator: TabBarCoordinator(), missionCoordinator: MissionCoordinator(), astronautCoordinator: AstronautCoordinator(), loginCoordinator: LoginCoordinator())
}
