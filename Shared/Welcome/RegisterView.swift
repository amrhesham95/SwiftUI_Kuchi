import SwiftUI

struct RegisterView: View {
    var body: some View {
        ZStack {
          WelcomeBackgroundImage()
          VStack {
            WelcomeMessageView()
          }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
