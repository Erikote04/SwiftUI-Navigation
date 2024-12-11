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
            MissionMainView(selectedTab: $selectedTab)
                .tag(1)
                .tabItem {
                    Label("Missions", systemImage: "flag.pattern.checkered.circle")
                }
            
            AstronautListView()
                .tag(2)
                .tabItem {
                    Label("Astronauts", systemImage: "person.circle.fill")
                }
        }
        .tint(.white)
    }
}

#Preview {
    MoonshotTabView()
}
