import SwiftUI

protocol LoginInjectorProtocol {
    func inject(coordinator: LoginCoordinator, for view: AppView) -> AnyView
    func inject(coordinator: LoginCoordinator, for sheet: Sheet) -> AnyView
    func inject(coordinator: LoginCoordinator, for fullScreenCover: FullScreenCover) -> AnyView
}

final class LoginInjector: LoginInjectorProtocol {
    
    private let useCase: LoginUseCaseProtocol
    
    init(useCase: LoginUseCaseProtocol) {
        self.useCase = useCase
    }
    
    private(set) lazy var viewModel: LoginViewModel = {
        LoginViewModel(loginUseCase: useCase)
    }()
    
    func inject(coordinator: LoginCoordinator, for view: AppView) -> AnyView {
        switch view {
        case .login: return AnyView(LoginView(coordinator: coordinator, viewModel: viewModel))
        case .register: return AnyView(RegisterView(coordinator: coordinator, viewModel: viewModel))
        default: fatalError("LoginInjector - Unsupported view type: \(view)")
        }
    }
    
    func inject(coordinator: LoginCoordinator, for sheet: Sheet) -> AnyView {
        switch sheet {
        case .forgotPassword: return AnyView(ForgotPasswordView(coordinator: coordinator, viewModel: viewModel))
        }
    }
    
    func inject(coordinator: LoginCoordinator, for fullScreenCover: FullScreenCover) -> AnyView {
        switch fullScreenCover {
        case .termsAndConditions: return AnyView(TermsAndConditionsView(coordinator: coordinator))
        }
    }
}
