import SwiftUI

struct TermsAndConditionsView: View {
    @ObservedObject var coordinator: LoginCoordinator
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Terms and Conditions")
                .font(.largeTitle)
            
            Button("Accept") { coordinator.dismissFullScreenCover() }
            
            Button("Back to Login") { coordinator.popToRoot() }
        }
    }
}

#Preview {
    TermsAndConditionsView(coordinator: LoginCoordinator())
}
