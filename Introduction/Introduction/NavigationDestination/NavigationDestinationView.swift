//
//  NavigationDestinationView.swift
//  Introduction
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct NavigationDestinationView: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { number in
                NavigationLink("Select \(number)", value: number)
            }
            .navigationDestination(for: Int.self) { number in
                DetailView(number: number)
            }
        }
    }
}

#Preview {
    NavigationDestinationView()
}
