//
//  LoginBuilderMock.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 12/6/25.
//

import SwiftUI
@testable import Navigation

final class LoginInjectorMock: LoginInjectorProtocol {
    var buildLoginCallCount = 0
    var buildRegisterCallCount = 0
    var presentSheetCallCount = 0
    var presentFullScreenCoverCallCount = 0
    
    func buildLogin(with coordinator: Navigation.LoginCoordinator) -> AnyView {
        buildLoginCallCount += 1
        return AnyView(EmptyView())
    }
    
    func buildRegister(with coordinator: Navigation.LoginCoordinator) -> AnyView {
        buildRegisterCallCount += 1
        return AnyView(EmptyView())
    }
    
    func presentSheet(with coordinator: Navigation.LoginCoordinator) -> AnyView {
        presentSheetCallCount += 1
        return AnyView(EmptyView())
    }
    
    func presentFullScreenCover(with coordinator: Navigation.LoginCoordinator) -> AnyView {
        presentFullScreenCoverCallCount += 1
        return AnyView(EmptyView())
    }
}
