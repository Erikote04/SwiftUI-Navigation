import SwiftUI

final class MissionCoordinator: BaseCoordinator {
    
    private let builder: MissionBuilderProtocol
    
    init(builder: MissionBuilderProtocol) {
        self.builder = builder
        super.init()
    }
    
    convenience override init() {
        let missionUseCase: MissionUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let AstronautUseCase: AstronautUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let builder = MissionBuilder(missionUseCase: missionUseCase, astronautUseCase: AstronautUseCase)
        
        self.init(builder: builder)
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .missions, .missionDetail(_), .astronautDetail(_): true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .missions: builder.build(with: self)
        case .missionDetail(let mission): builder.buildMissionDetail(with: self, for: mission)
        case .astronautDetail(let astronaut): builder.buildAstronautDetail(for: astronaut)
        default: EmptyView()
        }
    }
}
