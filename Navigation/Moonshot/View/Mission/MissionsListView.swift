import SwiftUI

struct MissionsListView: View {
    @ObservedObject var coordinator: MissionCoordinator
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                Button { coordinator.push(.missionDetail(mission)) }
                label: { MissionListRowView(mission: mission) }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionsListView(coordinator: MissionCoordinator(), missions: missions)
}
