import SwiftUI

enum Tab {
    case missions
    case astronauts
    case login
}

final class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .missions
}
