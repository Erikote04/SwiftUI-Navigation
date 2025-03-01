import SwiftUI

final class MissionCoordinator: FeatCoordinator, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    private let missionBuilder: MissionBuilder = MissionBuilder()
    
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
        case .missions, .missionDetail(_), .astronautDetail(_): true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .missions: missionBuilder.build(with: self)
        case .missionDetail(let mission): missionBuilder.buildMissionDetail(with: self, for: mission)
        case .astronautDetail(let astronaut): missionBuilder.buildAstronautDetail(for: astronaut)
        default: EmptyView()
        }
    }
}
