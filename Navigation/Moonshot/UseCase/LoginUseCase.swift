import Foundation

protocol LoginUseCaseProtocol: UseCaseProtocol {
    func login()
    func register()
    func forgotPassword()
}

class LoginUseCase: LoginUseCaseProtocol {
    func login() {}
    func register() {}
    func forgotPassword() {}
}
