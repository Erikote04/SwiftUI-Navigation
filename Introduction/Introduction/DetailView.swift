//
//  NavigationLinkDetailView.swift
//  Introduction
//
//  Created by Erik Sebastian de Erice Jerez on 11/12/24.
//

import SwiftUI

struct DetailView: View {
    let number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating Detail View \(number)")
    }
}
