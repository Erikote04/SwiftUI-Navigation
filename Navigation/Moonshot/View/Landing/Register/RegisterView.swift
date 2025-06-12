import SwiftUI

struct RegisterView: View {
    @ObservedObject var coordinator: LoginCoordinator
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Register")
                .font(.largeTitle.bold())
            
            Button("Terms and Conditions") {
                coordinator.presentFullScreenCover(.termsAndConditions)
            }
            
            Button {
                viewModel.register()
                coordinator.pop()
            } label: {
                Text("Register").foregroundStyle(.black)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
