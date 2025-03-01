import SwiftUI

struct HomeView: View {
    @StateObject private var missionCoordinator = MissionCoordinator()
    @StateObject private var astronautCoordinator = AstronautCoordinator()
    @State private var selectedTab: Tab = .missions
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $missionCoordinator.path) {
                missionCoordinator.build(.missions)
                    .navigationDestination(for: AppView.self) { view in
                        missionCoordinator.build(view)
                    }
            }
            .tag(Tab.missions)
            .tabItem {
                Label("Missions", systemImage: "flag.pattern.checkered.circle")
            }
            
            NavigationStack(path: $astronautCoordinator.path) {
                astronautCoordinator.build(.astronauts)
                    .navigationDestination(for: AppView.self) { view in
                        astronautCoordinator.build(view)
                    }
            }
            .tag(Tab.astronauts)
            .tabItem {
                Label("Astronauts", systemImage: "person.circle.fill")
            }
        }
        .tint(.white)
    }
}

#Preview {
    HomeView()
}
