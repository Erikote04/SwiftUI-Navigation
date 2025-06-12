import SwiftUI

class LoginCoordinator: BaseCoordinator {
    
    private let builder: LoginBuilderProtocol
    
    init(builder: LoginBuilderProtocol) {
        self.builder = builder
        super.init()
    }
    
    convenience override init() {
        let useCase: LoginUseCaseProtocol = UseCaseContainer.shared.getCurrentUseCase()
        let builder = LoginBuilder(useCase: useCase)
        
        self.init(builder: builder)
    }
    
    override func canHandle(view: AppView) -> Bool {
        switch view {
        case .login, .register: true
        default: false
        }
    }
    
    @ViewBuilder func build(_ view: AppView) -> some View {
        switch view {
        case .login: builder.buildLogin(with: self)
        case .register: builder.buildRegister(with: self)
        default: EmptyView()
        }
    }
    
    @ViewBuilder func build(_ sheet: Sheet) -> some View {
        switch sheet { case .forgotPassword: builder.presentSheet(with: self) }
    }
    
    @ViewBuilder func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover { case .termsAndConditions: builder.presentFullScreenCover(with: self) }
    }
}
