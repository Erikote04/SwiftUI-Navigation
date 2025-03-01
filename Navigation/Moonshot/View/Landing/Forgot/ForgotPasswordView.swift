import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var coordinator: LoginCoordinator
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Forgot Password")
                .font(.largeTitle.bold())
            
            Button {
                viewModel.forgotPassword()
                coordinator.dismissSheet()
            } label: { Text("Confirm").foregroundStyle(.black) }
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ForgotPasswordView(coordinator: LoginCoordinator(), viewModel: LoginViewModel())
}
