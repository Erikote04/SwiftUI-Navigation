//
//  LoginBuilderMock.swift
//  NavigationTests
//
//  Created by Erik Sebastian de Erice Jerez on 12/6/25.
//

import SwiftUI
@testable import Navigation

final class LoginInjectorMock: LoginInjectorProtocol {
    var injectLoginCallCount = 0
    var injectRegisterCallCount = 0
    var injectForgotPasswordCallCount = 0
    var injectTermsAndConditions = 0
    
    func inject(coordinator: any BaseCoordinatorProtocol, in view: AppView) -> AnyView {
        switch view {
        case .login: injectLoginCallCount += 1
        case .register: injectRegisterCallCount += 1
        default: break
        }
        
        return AnyView(EmptyView())
    }
    
    func inject(coordinator: any BaseCoordinatorProtocol, in sheet: Sheet) -> AnyView {
        switch sheet {
        case .forgotPassword: injectForgotPasswordCallCount += 1
        }
        
        return AnyView(EmptyView())
    }
    
    func inject(coordinator: any BaseCoordinatorProtocol, in fullScreenCover: FullScreenCover) -> AnyView {
        switch fullScreenCover {
        case .termsAndConditions: injectTermsAndConditions += 1
        }
        
        return AnyView(EmptyView())
    }
}
