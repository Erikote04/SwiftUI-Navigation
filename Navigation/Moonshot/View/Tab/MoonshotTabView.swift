import SwiftUI

struct MoonshotTabView: View {
    @StateObject private var coordinator = Coordinator()
    @StateObject private var tabViewModel = TabViewModel()
    
    var body: some View {
        TabView(selection: $tabViewModel.selectedTab) {
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
        .environmentObject(tabViewModel)
    }
}

#Preview {
    MoonshotTabView()
}
