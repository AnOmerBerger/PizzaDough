//
//  Slide5.swift
//  PizzaDough
//
//  Created by Omer on 6/18/21.
//

import SwiftUI
import SSSwiftUIGIFView

struct Slide5: View {
    @EnvironmentObject var synch : Synchronizer
    @State var itsTheSame: Bool = false
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Autolyzing 4/4")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                VStack {
                    Text("""
Cover the dough and let it rest for
X minutes.
""").bold()
                    Text("This will allow the gluten network to develop and the enzymes to begin breaking the starches into sugars.")
                    Spacer()
                    SwiftUIGIFPlayerView(gifName: "autolyze-dough-cover")
                    Spacer()
                    Spacer()
                    ZStack {
                            RoundedRectangle(cornerRadius: 1).frame(maxWidth: g.size.width * 0.7, maxHeight: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.1568627451, green: 0.5254901961, blue: 0.02745098039, alpha: 1)))
                            Text("ready for the next step").foregroundColor(.white).font(.title2)
                                .onTapGesture { synch.slideShowing += 1 }
                    }
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide5Showing = true }
            .onDisappear { synch.slide5Showing = false }
        }
    }
}

struct Slide5_Previews: PreviewProvider {
    static var previews: some View {
        Slide5().environmentObject(Synchronizer())
    }
}
