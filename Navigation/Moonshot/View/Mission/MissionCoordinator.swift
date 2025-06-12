import SwiftUI

final class MissionCoordinator: BaseCoordinator {
    
    private let injector: MissionInjectorProtocol
    
    init(injector: MissionInjectorProtocol) {
        self.injector = injector
        super.init()
    }
    
    convenience override init() {
        let missionUseCase: MissionUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let AstronautUseCase: AstronautUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let injector = MissionInjector(missionUseCase: missionUseCase, astronautUseCase: AstronautUseCase)
        
        self.init(injector: injector)
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .missions, .missionDetail(_), .astronautDetail(_): true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .missions: injector.inject(coordinator: self, in: view)
        case .missionDetail(_): injector.inject(coordinator: self, in: view)
        case .astronautDetail(_): injector.inject(coordinator: self, in: view)
        default: fatalError("MissionCoordinator - Unsupported view: \(view)")
        }
    }
}
