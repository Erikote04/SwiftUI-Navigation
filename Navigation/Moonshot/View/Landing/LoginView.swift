import SwiftUI

struct LoginView: View {
    @ObservedObject var coordinator: LoginCoordinator
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .font(.largeTitle.bold())
            
            Button("Forgot password?") { coordinator.presentSheet(.forgotPassword) }
            
            Button { viewModel.login() } label: { Text("Login").foregroundStyle(.black) }
                .buttonStyle(.borderedProminent)
            
            Button("Register") { coordinator.push(.register) }
                .buttonStyle(.borderedProminent)
                .tint(.secondary)
        }
    }
}

#Preview {
    LoginView(coordinator: LoginCoordinator(), viewModel: LoginViewModel())
}
