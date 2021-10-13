import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @EnvironmentObject var userManager: UserManager
    @ObservedObject var keyboardHandler: KeyboardFollower
    var body: some View {
        ZStack {
          VStack {
            Spacer()
            
            WelcomeMessageView()
            TextField("Type your name...", text: $userManager.profile.name)
                .bordered()
            Button(action: registerUser, label: {
                Text("OK")
            })
            Spacer()
          }.padding()
          .padding(.bottom, keyboardHandler.keyboardHeight)
          .edgesIgnoringSafeArea(
            keyboardHandler.isVisible ? .bottom : [])
          .background(WelcomeBackgroundImage())
        }
    }
}

extension RegisterView {
    func registerUser() {
        userManager.persistProfile()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static let user = UserManager(name: "Amr")
    static var previews: some View {
        
        RegisterView(keyboardHandler: KeyboardFollower())
            .environmentObject(user)
    }
}
