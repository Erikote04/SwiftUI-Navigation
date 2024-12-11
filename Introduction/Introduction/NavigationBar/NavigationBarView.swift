//
//  NavigationBarView.swift
//  Introduction
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct NavigationBarView: View {
    @State private var navigationTitle = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle($navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Tap me") { }
                }
            }
        }
    }
}

#Preview {
    NavigationBarView()
}
