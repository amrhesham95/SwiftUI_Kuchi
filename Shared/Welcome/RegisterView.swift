import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    @ObservedObject var keyboardHandler: KeyboardFollower
    var body: some View {
        ZStack {
          VStack {
            Spacer()
            
            WelcomeMessageView()
            
            
            TextField("Type your name...", text: $userManager.profile.name)
                .bordered()
            
            HStack {
                Spacer()
                Text("Name length: \(userManager.profile.name.count)")
                    .font(.caption)
                    .foregroundColor(
                      userManager.isUserNameValid() ? .green : .red)
                    .padding(.trailing)
                
            }
            
            Button(action: registerUser, label: {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("OK")
                        .font(.body)
                        .bold()
                }
            })
            .bordered()
            .disabled(!userManager.isUserNameValid())
            
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
