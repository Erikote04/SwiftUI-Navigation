//
//  MoonshotTabView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct MoonshotTabView: View {
    @State private var selectedTab: Tab = .missions
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MissionsView(selectedTab: $selectedTab)
                .tag(Tab.missions)
                .tabItem {
                    Label("Missions", systemImage: "flag.pattern.checkered.circle")
                }
            
            AstronautsListView()
                .tag(Tab.astronauts)
                .tabItem {
                    Label("Astronauts", systemImage: "person.circle.fill")
                }
            
            FirstChallengeRootView()
                .tag(Tab.firstChallenge)
                .tabItem {
                    Label("Challenge", systemImage: "1.circle.fill")
                }
            
            SecondChallengeRootView()
                .tag(Tab.secondChallenge)
                .tabItem {
                    Label("Challenge", systemImage: "2.circle.fill")
                }
        }
        .tint(.white)
    }
}

#Preview {
    MoonshotTabView()
}
