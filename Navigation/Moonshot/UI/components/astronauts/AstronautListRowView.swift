//
//  AstronautListRowView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct AstronautListRowView: View {
    let astronaut: Astronaut
    
    var body: some View {
        HStack {
            Image(astronaut.id)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(astronaut.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal)
    }
}
