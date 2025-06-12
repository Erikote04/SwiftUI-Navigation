import SwiftUI

struct AstronautsView: View {
    @ObservedObject var coordinator: AstronautCoordinator
    @ObservedObject var viewModel: AstronautViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.sortedAstronautsByName) { astronaut in
                Button { coordinator.push(.astronautDetail(astronaut)) }
                label: { AstronautListRowView(astronaut: astronaut) }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .navigationTitle("Astronauts")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
        .onAppear {
            viewModel.onAppear()
        }
    }
}
