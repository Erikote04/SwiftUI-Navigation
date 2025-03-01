import SwiftUI

final class LoginBuilder {
    
    private(set) lazy var viewModel: LoginViewModel = {
        LoginViewModel(loginUseCase: UseCaseContainer.shared.getCurrentUseCase())
    }()
    
    func buildLogin(with coordinator: LoginCoordinator) -> some View {
        LoginView(coordinator: coordinator, viewModel: viewModel)
    }
    
    /// Builds RegisterView
    func buildRegister(with coordinator: LoginCoordinator) -> some View {
        RegisterView(coordinator: coordinator, viewModel: viewModel)
    }
    
    /// Builds ForgotPasswordView
    func presentSheet(with coordinator: LoginCoordinator) -> some View {
        ForgotPasswordView(coordinator: coordinator, viewModel: viewModel)
    }
    
    /// Builds TermsAndConditionsView
    func presentFullScreenCover(with coordinator: LoginCoordinator) -> some View {
        TermsAndConditionsView(coordinator: coordinator)
    }
}
