import SwiftUI

@main
struct MoonshotApp: App {
    @StateObject private var tabBarCoordinator = TabBarCoordinator()
    
    var body: some Scene {
        WindowGroup {
            tabBarCoordinator.build(.tabBar)
                .environmentObject(tabBarCoordinator)
        }
    }
}
