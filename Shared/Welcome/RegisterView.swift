import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @ObservedObject var keyboardHandler: KeyboardFollower
    var body: some View {
        ZStack {
          VStack {
            Spacer()
            
            WelcomeMessageView()
            TextField("Type your name...", text: $name)
                .bordered()
            Spacer()
          }.padding()
          .padding(.bottom, keyboardHandler.keyboardHeight)
          .edgesIgnoringSafeArea(
            keyboardHandler.isVisible ? .bottom : [])
          .background(WelcomeBackgroundImage())
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(keyboardHandler: KeyboardFollower())
    }
}
