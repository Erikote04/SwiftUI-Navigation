//
//  PushedView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 13/12/24.
//

import SwiftUI

struct PushedView: View {
    @State private var isShowingImage: Bool = false
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        isShowingImage.toggle()
                    }
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .sheet(isPresented: $isShowingImage) {
            SecondModalView(imageName: astronaut.id)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    PushedView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
