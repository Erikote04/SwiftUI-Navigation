import SwiftUI

class LoginCoordinator: BaseCoordinator {
    
    private let injector: LoginInjectorProtocol
    
    init(injector: LoginInjectorProtocol) {
        self.injector = injector
        super.init()
    }
    
    convenience override init() {
        let useCase: LoginUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let injector = LoginInjector(useCase: useCase)
        
        self.init(injector: injector)
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .login, .register: true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .login: injector.buildLogin(with: self)
        case .register: injector.buildRegister(with: self)
        default: EmptyView()
        }
    }
    
    @ViewBuilder func build(_ sheet: Sheet) -> some View {
        switch sheet { case .forgotPassword: injector.presentSheet(with: self) }
    }
    
    @ViewBuilder func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover { case .termsAndConditions: injector.presentFullScreenCover(with: self) }
    }
}
