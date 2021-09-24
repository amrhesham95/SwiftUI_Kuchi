import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    
    var body: some View {
        ZStack {
          VStack {
            Spacer()
            
            WelcomeMessageView()
            TextField("Type your name...", text: $name)
            
            Spacer()
          }
        }.background(WelcomeBackgroundImage())
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
