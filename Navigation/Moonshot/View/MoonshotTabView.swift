//
//  MoonshotTabView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct MoonshotTabView: View {
    @StateObject private var coordinator = Coordinator()
    @State private var selectedTab: Tab = .missions
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(view: .missions)
                    .navigationDestination(for: AppView.self) { view in
                        coordinator.build(view: view)
                    }
            }
            .tag(Tab.missions)
            .tabItem {
                Label("Missions", systemImage: "flag.pattern.checkered.circle")
            }
            
            NavigationStack(path: $coordinator.path) {
                coordinator.build(view: .astronauts)
                    .navigationDestination(for: AppView.self) { view in
                        coordinator.build(view: view)
                    }
            }
            .tag(Tab.astronauts)
            .tabItem {
                Label("Astronauts", systemImage: "person.circle.fill")
            }
            
            //            FirstChallengeRootView()
            //                .tag(Tab.firstChallenge)
            //                .tabItem {
            //                    Label("Challenge", systemImage: "1.circle.fill")
            //                }
            //
            //            SecondChallengeRootView()
            //                .tag(Tab.secondChallenge)
            //                .tabItem {
            //                    Label("Challenge", systemImage: "2.circle.fill")
            //                }
        }
        .tint(.white)
    }
}

#Preview {
    MoonshotTabView()
}
