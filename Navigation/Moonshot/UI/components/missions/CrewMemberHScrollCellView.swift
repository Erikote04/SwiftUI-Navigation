import SwiftUI

struct CrewMemberHScrollCellView: View {
    let crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text(crewMember.role)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal)
    }
}
