//
//  MissionMainView.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 20/11/24.
//

import SwiftUI

struct MissionMainView: View {
    @Binding var selectedTab: Tab
    @State private var isShowingGrid: Bool = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if isShowingGrid {
                    MissionGridView(missions: missions)
                } else {
                    MissionListView(missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .navigationDestination(for: Mission.self) { mission in
                MissionView(selectedTab: $selectedTab, mission: mission, astronauts: astronauts)
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: isShowingGrid ? "square.grid.2x2" : "list.bullet") { isShowingGrid.toggle() }
                }
            }
        }
        .tint(.white)
    }
}

#Preview {
    MissionMainView(selectedTab: .constant(Tab.missions))
}
