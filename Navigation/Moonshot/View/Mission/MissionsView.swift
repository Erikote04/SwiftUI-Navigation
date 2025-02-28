//
//  MissionMainView.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 20/11/24.
//

import SwiftUI

struct MissionsView: View {
    @ObservedObject var coordinator: Coordinator
    @ObservedObject var viewModel: MissionViewModel
    
    var body: some View {
        Group {
            if viewModel.isShowingGrid { MissionsGridView(coordinator: coordinator, missions: viewModel.missions) }
            else { MissionsListView(coordinator: coordinator, missions: viewModel.missions) }
        }
        .navigationTitle("Moonshot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: viewModel.isShowingGrid ? "square.grid.2x2" : "list.bullet") {
                    viewModel.isShowingGrid.toggle()
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    MissionsView(coordinator: Coordinator(), viewModel: MissionViewModel())
}
