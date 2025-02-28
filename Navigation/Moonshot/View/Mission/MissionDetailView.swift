//
//  MissionView.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 18/10/24.
//

import SwiftUI

struct MissionDetailView: View {
    @ObservedObject var viewModel: MissionViewModel
    @Binding var selectedTab: Tab
    
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                
                Text(mission.formattedLaunchDate)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.top, 8)
                
                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 4)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Button {
                        selectedTab = .astronauts
                    } label: {
                        HStack {
                            Text("Astronauts")
                                .font(.title.bold())
                                .foregroundStyle(.white)
                                .padding(.bottom, 4)
                            
                            Image(systemName: "chevron.right")
                                .font(.title2.bold())
                                .foregroundStyle(.lightBackground)
                        }
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautDetailView(astronaut: crewMember.astronaut)
                            } label: {
                                CrewMemberHScrollCellView(crewMember: crewMember)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .onAppear {
            viewModel.getCrew(mission: mission, astronauts: viewModel.astronauts)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    MissionDetailView(viewModel: MissionViewModel(), selectedTab: .constant(Tab.missions), mission: missions[0])
        .preferredColorScheme(.dark)
}
