import SwiftUI

protocol LoginInjectorProtocol: BaseInjectorProtocol {
    /*
     Add your specific methods for this protocol if necessary
     */
}

final class LoginInjector: LoginInjectorProtocol {
    
    private let useCase: LoginUseCaseProtocol
    
    init(useCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.useCase = useCase
    }
    
    private(set) lazy var viewModel: LoginViewModel = {
        LoginViewModel(loginUseCase: useCase)
    }()
    
    func inject(coordinator: any BaseCoordinatorProtocol, in view: AppView) -> AnyView {
        guard let coordinator = coordinator as? LoginCoordinator else {
            fatalError("LoginInjector requires LoginCoordinator")
        }
        
        switch view {
        case .login: return AnyView(LoginView(coordinator: coordinator, viewModel: viewModel))
        case .register: return AnyView(RegisterView(coordinator: coordinator, viewModel: viewModel))
        default: fatalError("LoginInjector - Unsupported view type: \(view)")
        }
    }
    
    func inject(coordinator: any BaseCoordinatorProtocol, in sheet: Sheet) -> AnyView {
        guard let coordinator = coordinator as? LoginCoordinator else {
            fatalError("LoginInjector requires LoginCoordinator")
        }
        
        switch sheet {
        case .forgotPassword: return AnyView(ForgotPasswordView(coordinator: coordinator, viewModel: viewModel))
        }
    }
    
    func inject(coordinator: any BaseCoordinatorProtocol, in fullScreenCover: FullScreenCover) -> AnyView {
        guard let coordinator = coordinator as? LoginCoordinator else {
            fatalError("LoginInjector requires LoginCoordinator")
        }
        
        switch fullScreenCover {
        case .termsAndConditions: return AnyView(TermsAndConditionsView(coordinator: coordinator))
        }
    }
}
