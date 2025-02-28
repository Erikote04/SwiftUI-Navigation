//
//  Coordinator.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 28/2/25.
//

import SwiftUI

protocol CoordinatorProtocol {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    
    func push(_ view: AppView)
    func pop()
    func popToRoot()
    
    func presentSheet(_ sheet: Sheet)
    func dismissSheet()
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func dismissFullScreenCover()
}

final class Coordinator: CoordinatorProtocol, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    private let astronautViewModel: AstronautViewModel
    private let missionViewModel: MissionViewModel
    
    init() {
        let missionUseCase = MissionUseCase()
        let astronautUseCase = AstronautUseCase()
        
        self.missionViewModel = MissionViewModel(
            missionUseCase: missionUseCase,
            astronautUseCase: astronautUseCase
        )
        
        self.astronautViewModel = AstronautViewModel(
            astronautsUseCase: astronautUseCase
        )
    }
    
    func push(_ view: AppView) {
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
    
    @ViewBuilder
    func build(_ view: AppView) -> some View {
        switch view {
        case .missions: MissionsView(coordinator: self, viewModel: missionViewModel)
        case .missionDetail(let mission): MissionDetailView(viewModel: missionViewModel, mission: mission)
        case .astronauts: AstronautsListView(coordinator: self, viewModel: astronautViewModel)
        case .astronautDetail(let astronaut): AstronautDetailView(astronaut: astronaut)
        }
    }
    
//    @ViewBuilder
//    func build(_ sheet: Sheet) -> some View {
//        switch sheet {
//        case .imageDetail(let image): ImageDetailView(image: image)
//        }
//    }
//    
//    @ViewBuilder
//    func build(_ fullScreenCover: FullScreenCover) -> some View {
//        switch fullScreenCover {
//        case .missionDetail(let mission): FullScreenCoverView(coordinator: self, viewModel: missionViewModel, mission: mission)
//        }
//    }
}
