//
//  AstronautBuilderMock.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 11/6/25.
//

import SwiftUI
@testable import Navigation

final class AstronautBuilderMock: AstronautBuilderProtocol {
    var buildAstronautCallCount = 0
    var buildAstronautDetailCallCount = 0
    
    var astronaut: Astronaut?
    
    func build(with coordinator: AstronautCoordinator) -> AnyView {
        buildAstronautCallCount += 1
        return AnyView(EmptyView())
    }
    
    func buildAstronautDetail(for astronaut: Astronaut) -> AnyView {
        buildAstronautDetailCallCount += 1
        self.astronaut = astronaut
        return AnyView(EmptyView())
    }
}
