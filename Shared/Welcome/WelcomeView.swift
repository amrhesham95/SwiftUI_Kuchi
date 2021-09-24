import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            WelcomeBackgroundImage()
            Label {
                LogoImage()
            } icon: {
               WelcomeMessageView()
            }.labelStyle(HorizontallyAlignedLabelStyle()) // Label
        } // Zstack
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
