import SwiftUI

@main
struct MoonshotApp: App {
    @StateObject var tabbarViewModel = TabBarViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(tabbarViewModel)
        }
    }
}
