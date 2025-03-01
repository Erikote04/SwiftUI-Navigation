import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var tabBar: TabBarViewModel
    @StateObject private var missionCoordinator = MissionCoordinator()
    @StateObject private var astronautCoordinator = AstronautCoordinator()
    
    var body: some View {
        TabView(selection: $tabBar.selectedTab) {
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
        }
        .tint(.white)
    }
}

#Preview {
    TabBarView()
}
