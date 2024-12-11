//
//  ChildView.swift
//  Introduction
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct ChildView: View {
    @Binding var path: NavigationPath
    // @Binding var path: [Int]
    // @Binding var path: NavigationPath
    
    let number: Int
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                    // path.removeAll()
                    // path = NavigationPath()
                }
            }
    }
}
