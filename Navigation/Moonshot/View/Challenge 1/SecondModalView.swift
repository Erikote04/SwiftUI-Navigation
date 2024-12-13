//
//  SecondModalView.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 13/12/24.
//

import SwiftUI

struct SecondModalView: View {
    @Environment(\.dismiss) private var dismiss
    
    let imageName: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.darkBackground)
                
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationTitle(imageName)
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    SecondModalView(imageName: "aldrin")
        .preferredColorScheme(.dark)
}
