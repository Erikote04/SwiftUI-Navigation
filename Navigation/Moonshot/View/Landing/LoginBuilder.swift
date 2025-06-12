import SwiftUI

protocol LoginBuilderProtocol {
    func buildLogin(with coordinator: LoginCoordinator) -> AnyView
    func buildRegister(with coordinator: LoginCoordinator) -> AnyView
    func presentSheet(with coordinator: LoginCoordinator) -> AnyView
    func presentFullScreenCover(with coordinator: LoginCoordinator) -> AnyView
}

final class LoginBuilder: LoginBuilderProtocol {
    
    private let useCase: LoginUseCaseProtocol
    
    init(useCase: LoginUseCaseProtocol) {
        self.useCase = useCase
    }
    
    private(set) lazy var viewModel: LoginViewModel = {
        LoginViewModel(loginUseCase: useCase)
    }()
    
    func buildLogin(with coordinator: LoginCoordinator) -> AnyView {
        AnyView(LoginView(coordinator: coordinator, viewModel: viewModel))
    }
    
    func buildRegister(with coordinator: LoginCoordinator) -> AnyView {
        AnyView(RegisterView(coordinator: coordinator, viewModel: viewModel))
    }
    
    func presentSheet(with coordinator: LoginCoordinator) -> AnyView {
        AnyView(ForgotPasswordView(coordinator: coordinator, viewModel: viewModel))
    }
    
    func presentFullScreenCover(with coordinator: LoginCoordinator) -> AnyView {
        AnyView(TermsAndConditionsView(coordinator: coordinator))
    }
}
