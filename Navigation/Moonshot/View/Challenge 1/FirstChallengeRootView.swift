//
//  RootView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 13/12/24.
//

import SwiftUI

struct FirstChallengeRootView: View {
    @State private var selectedMission: Mission? = nil
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    var body: some View {
        NavigationStack {
            List {
                ForEach(missions) { mission in
                    Button {
                        selectedMission = mission
                    } label: {
                        MissionListRowView(mission: mission)
                    }
                    .listRowBackground(Color.darkBackground)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Challenge 1")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .fullScreenCover(item: $selectedMission) { mission in
                FirstModalView(mission: mission, astronauts: astronauts)
            }
        }
        .tint(.white)
    }
}

#Preview {
    FirstChallengeRootView()
}
