import SwiftUI

class AstronautCoordinator: BaseCoordinator {
    
    private let astronautBuilder: AstronautBuilder = AstronautBuilder()
    
    override init() {}
    
    override func canHandle(view: AppView) -> Bool {
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
