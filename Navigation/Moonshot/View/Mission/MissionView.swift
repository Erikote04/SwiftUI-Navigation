//
//  MissionView.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 18/10/24.
//

import SwiftUI

struct MissionView: View {
    @Binding var selectedTab: Tab
    
    let mission: Mission
    let crew: [CrewMember]
    
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
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
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
    }
    
    init(selectedTab: Binding<Tab>, mission: Mission, astronauts: [String: Astronaut]) {
        self._selectedTab = selectedTab
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    MissionView(selectedTab: .constant(Tab.missions), mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
