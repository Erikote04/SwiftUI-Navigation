//
//  DifferentDataTypesView.swift
//  Introduction
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct DifferentDataTypesView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Int") {
                    ForEach(0..<5) { i in
                        NavigationLink("Select Number \(i)", value: i)
                    }
                }
                
                Section("String") {
                    ForEach(0..<5) { i in
                        NavigationLink("Select String \(i)", value: String(i))
                    }
                }
            }
            .toolbar {
                Button("Push 25") {
                    path.append(25)
                }
                
                Button("Push Years") {
                    path.append("Years")
                }
            }
            .navigationDestination(for: Int.self) { number in
                Text("Selected Number: \(number)")
            }
            .navigationDestination(for: String.self) { string in
                Text("Selected String: \(string)")
            }
        }
    }
}

#Preview {
    DifferentDataTypesView()
}
