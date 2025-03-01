import SwiftUI

@main
struct MoonshotApp: App {
    @StateObject private var tabBar = TabBarViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(tabBar)
        }
    }
}
