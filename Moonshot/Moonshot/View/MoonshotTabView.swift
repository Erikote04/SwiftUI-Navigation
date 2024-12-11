//
//  MoonshotTabView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct MoonshotTabView: View {
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: selectedTab) {
                MissionMainView(selectedTab: $selectedTab)
                    .tag(1)
            } label: {
                Label("Missions", systemImage: "flag.pattern.checkered.circle")
            }
            
            Tab(value: selectedTab) {
                AstronautListView(selectedTab: $selectedTab)
                    .tag(2)
            } label: {
                Label("Astronauts", systemImage: "person.circle.fill")
            }
        }
        .tint(.white)
    }
}

#Preview {
    MoonshotTabView()
}
