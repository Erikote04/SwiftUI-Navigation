//
//  Coordinator.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 28/2/25.
//

import SwiftUI

protocol CoordinatorProtocol {
    var path: NavigationPath { get set }
    
    func push(_ view: AppView)
    func pop()
    func popToRoot()
}

final class Coordinator: CoordinatorProtocol, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
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
    
    @ViewBuilder
    func build(view: AppView) -> some View {
        switch view {
        case .missions: MissionsView(coordinator: self, viewModel: missionViewModel)
        case .missionDetail(let mission): MissionDetailView(viewModel: missionViewModel, mission: mission)
        case .astronauts: AstronautsListView(coordinator: self, viewModel: astronautViewModel)
        case .astronautDetail(let astronaut): AstronautDetailView(astronaut: astronaut)
        }
    }
}
