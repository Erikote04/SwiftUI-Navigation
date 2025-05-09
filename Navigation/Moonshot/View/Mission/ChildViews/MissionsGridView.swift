import SwiftUI

struct MissionsGridView: View {
    @ObservedObject var coordinator: MissionCoordinator
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    Button { coordinator.push(.missionDetail(mission)) }
                    label: { MissionGridCellView(mission: mission) }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionsGridView(coordinator: MissionCoordinator(), missions: missions)
}
