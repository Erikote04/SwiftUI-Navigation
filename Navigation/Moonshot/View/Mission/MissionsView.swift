import SwiftUI

struct MissionsView: View {
    @ObservedObject var coordinator: MissionCoordinator
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
