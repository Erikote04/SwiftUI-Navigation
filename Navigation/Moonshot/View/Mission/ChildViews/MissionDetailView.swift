import SwiftUI

struct MissionDetailView: View {
    @ObservedObject var coordinator: MissionCoordinator
    @ObservedObject var viewModel: MissionViewModel
    
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                MissionDetails(mission: mission)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.crew, id: \.role) { crewMember in
                            Button { coordinator.push(.astronautDetail(crewMember.astronaut)) }
                            label: { CrewMemberHScrollCellView(crewMember: crewMember) }
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
            viewModel.onAppear()
            viewModel.getCrew(mission: mission, astronauts: viewModel.astronauts)
        }
    }
}

private struct MissionDetails: View {
    @EnvironmentObject var tabBarCoordinator: TabBarCoordinator
    
    let mission: Mission
    
    var body: some View {
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
            
            HStack(alignment: .bottom) {
                Text("Crew")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button { tabBarCoordinator.selectedTab = .astronauts }
                label: {
                    HStack(spacing: 8) {
                        Text("Astronauts")
                            .foregroundStyle(.white)
                            .padding(.bottom, 4)
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
