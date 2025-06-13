import SwiftUI

final class LoginCoordinator: BaseCoordinator {
    
    private let injector: LoginInjectorProtocol
    
    init(injector: LoginInjectorProtocol = LoginInjector()) {
        self.injector = injector
        super.init()
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .login, .register: true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .login: injector.inject(coordinator: self, in: view)
        case .register: injector.inject(coordinator: self, in: view)
        default: EmptyView()
        }
    }
    
    @ViewBuilder func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .forgotPassword: injector.inject(coordinator: self, in: sheet)
        }
    }
    
    @ViewBuilder func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .termsAndConditions: injector.inject(coordinator: self, in: fullScreenCover)
        }
    }
}
