//
//  BaseInjector.swift
//  Navigation
//
//  Created by Erik Sebastian de Erice Jerez on 12/6/25.
//

import SwiftUI

protocol BaseInjectorProtocol {
    func inject(coordinator: BaseCoordinatorProtocol, in view: AppView) -> AnyView
    func inject(coordinator: BaseCoordinatorProtocol, in sheet: Sheet) -> AnyView
    func inject(coordinator: BaseCoordinatorProtocol, in fullScreenCover: FullScreenCover) -> AnyView
}

extension BaseInjectorProtocol {
    func inject(coordinator: BaseCoordinatorProtocol, in sheet: Sheet) -> AnyView {
        fatalError("Sheet injection not supported by \(type(of: self))")
    }
    
    func inject(coordinator: BaseCoordinatorProtocol, in fullScreenCover: FullScreenCover) -> AnyView {
        fatalError("FullScreenCover injection not supported by \(type(of: self))")
    }
}

class BaseInjector: BaseInjectorProtocol {
    
    func inject(coordinator: BaseCoordinatorProtocol, in view: AppView) -> AnyView {
        fatalError("BaseInjector - inject(coordinator:for:) must be overridden by subclass")
    }
    
    func inject(coordinator: BaseCoordinatorProtocol, in sheet: Sheet) -> AnyView {
        fatalError("BaseInjector - inject(coordinator:for:sheet) must be overridden by subclass")
    }
    
    func inject(coordinator: BaseCoordinatorProtocol, in fullScreenCover: FullScreenCover) -> AnyView {
        fatalError("BaseInjector - inject(coordinator:for:fullScreenCover) must be overridden by subclass")
    }
}
