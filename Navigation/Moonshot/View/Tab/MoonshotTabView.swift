import SwiftUI

struct MoonshotTabView: View {
    @StateObject private var coordinator = Coordinator()
    @State private var selectedTab: Tab = .missions
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(.missions)
                    .navigationDestination(for: AppView.self) { view in
                        coordinator.build(view)
                    }
            }
            .tag(Tab.missions)
            .tabItem {
                Label("Missions", systemImage: "flag.pattern.checkered.circle")
            }
            
            NavigationStack(path: $coordinator.path) {
                coordinator.build(.astronauts)
                    .navigationDestination(for: AppView.self) { view in
                        coordinator.build(view)
                    }
            }
            .tag(Tab.astronauts)
            .tabItem {
                Label("Astronauts", systemImage: "person.circle.fill")
            }
        }
        .tint(.white)
        .environmentObject(coordinator)
    }
}

#Preview {
    MoonshotTabView()
}
