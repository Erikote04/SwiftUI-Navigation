import SwiftUI

class AstronautCoordinator: FeatCoordinator, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    private let astronautBuilder: AstronautBuilder = AstronautBuilder()
    
    init() {}
    
    func push(_ view: AppView) {
        guard canHandle(view: view) else { return }
        path.append(view)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    func canHandle(view: AppView) -> Bool {
        switch view {
        case .astronauts, .astronautDetail(_): true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .astronauts: astronautBuilder.build(with: self)
        case .astronautDetail(let astronaut): astronautBuilder.buildAstronautDetail(for: astronaut)
        default: EmptyView()
        }
    }
}
