//
//  MissionListView.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 20/11/24.
//

import SwiftUI

struct MissionsListView: View {
    @ObservedObject var coordinator: Coordinator
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
    MissionsListView(coordinator: Coordinator(), missions: missions)
}
