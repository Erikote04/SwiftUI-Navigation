//
//  AstronautListView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct AstronautListView: View {
    @StateObject private var viewModel: AstronautViewModel = AstronautViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sortedAstronautsByName) { astronaut in
                    NavigationLink(value: astronaut) {
                        AstronautListRowView(astronaut: astronaut)
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
            .listStyle(.plain)
            .navigationTitle("Astronauts")
            .navigationDestination(for: Astronaut.self) { astronaut in
                AstronautView(astronaut: astronaut)
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
        .tint(.white)
        .onAppear {
            viewModel.viewAppear()
        }
    }
}

#Preview {
    AstronautListView()
}
