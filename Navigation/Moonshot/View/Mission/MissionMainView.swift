//
//  MissionMainView.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 20/11/24.
//

import SwiftUI

struct MissionMainView: View {
    @StateObject private var viewModel: MissionViewModel = MissionViewModel()
    @Binding var selectedTab: Tab
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isShowingGrid {
                    MissionGridView(missions: viewModel.missions)
                } else {
                    MissionListView(missions: viewModel.missions)
                }
            }
            .navigationTitle("Moonshot")
            .navigationDestination(for: Mission.self) { mission in
                MissionView(viewModel: viewModel, selectedTab: $selectedTab, mission: mission)
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: viewModel.isShowingGrid ? "square.grid.2x2" : "list.bullet") { viewModel.isShowingGrid.toggle() }
                }
            }
        }
        .tint(.white)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    MissionMainView(selectedTab: .constant(Tab.missions))
}
