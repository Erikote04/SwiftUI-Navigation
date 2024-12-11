//
//  RootView.swift
//  Introduction
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct RootView: View {
    @State private var path = [Int]()
    // @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ChildView(path: $path, number: 0)
                .navigationDestination(for: Int.self) { number in
                    ChildView(path: $path, number: number)
                }
        }
    }
}

#Preview {
    RootView()
}
