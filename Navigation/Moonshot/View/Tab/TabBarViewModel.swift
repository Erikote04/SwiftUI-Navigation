import SwiftUI

enum Tab {
    case missions
    case astronauts
}

final class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .missions
}
