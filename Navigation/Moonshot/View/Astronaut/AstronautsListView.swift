import SwiftUI

struct AstronautsListView: View {
    @ObservedObject var coordinator: Coordinator
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
            viewModel.viewAppear()
        }        
    }
}

#Preview {
    AstronautsListView(coordinator: Coordinator(), viewModel: AstronautViewModel())
}
