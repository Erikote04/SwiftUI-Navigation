//
//  SecondChallengeRootView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 13/12/24.
//

import SwiftUI

struct SecondChallengeRootView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    private var sortedAstronautsByName: [Astronaut] {
        astronauts.values.sorted { $0.name < $1.name }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sortedAstronautsByName) { astronaut in
                    NavigationLink(value: astronaut) {
                        AstronautListRowView(astronaut: astronaut)
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
            .listStyle(.plain)
            .navigationTitle("Astronauts")
            .navigationDestination(for: Astronaut.self) { astronaut in
                DetailView(astronaut: astronaut)
                    .toolbar(.hidden, for: .tabBar)
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
        .tint(.white)
    }
}

#Preview {
    SecondChallengeRootView()
}
