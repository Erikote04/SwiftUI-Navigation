//
//  NavigationLinkView.swift
//  Introduction
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { number in
                NavigationLink("Row \(number)") {
                    NavigationLinkDetailView(number: number)
                }
            }
        }
    }
}

#Preview {
    NavigationLinkView()
}
