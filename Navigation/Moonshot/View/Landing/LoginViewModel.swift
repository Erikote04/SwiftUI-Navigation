import Foundation

protocol LoginViewModelProtocol {
    func login()
    func register()
    func forgotPassword()
}

final class LoginViewModel: LoginViewModelProtocol, ObservableObject {
    
    private let loginUseCase: LogLoginUseCaseProtocol
    
    init(loginUseCase: LogLoginUseCaseProtocol = LogLoginUseCase()) {
        self.loginUseCase = loginUseCase
    }
    
    func login() {
        loginUseCase.login()
    }
        
    func register() {
        loginUseCase.register()
    }
    
    func forgotPassword() {
        loginUseCase.forgotPassword()
    }
}
