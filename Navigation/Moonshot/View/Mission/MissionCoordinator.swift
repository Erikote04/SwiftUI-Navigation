import SwiftUI

final class MissionCoordinator: BaseCoordinator {
    
    private let missionBuilder: MissionBuilder = MissionBuilder()
    
    override init() { super.init() }
    
    override func canHandle(view: AppView) -> Bool {
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
