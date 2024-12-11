//
//  MissionListRowView.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 20/11/24.
//

import SwiftUI

struct MissionListRowView: View {
    let mission: Mission
    
    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text(mission.formattedLaunchDate)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal)
    }
}
