import Foundation

protocol LogLoginUseCaseProtocol: UseCaseProtocol {
    func login()
    func register()
    func forgotPassword()
}

class LogLoginUseCase: LogLoginUseCaseProtocol {
    func login() {}
    func register() {}
    func forgotPassword() {}
}
