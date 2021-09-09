//
//  Slide9.swift
//  PizzaDough
//
//  Created by Omer on 6/19/21.
//

import SwiftUI

struct Slide9: View {
    @EnvironmentObject var synch : Synchronizer

    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Kneading 3/4")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                VStack {
                    Color(#colorLiteral(red: 0.7960784314, green: 0.1490196078, blue: 0.1490196078, alpha: 0.780695631))
                        .overlay(
                            VStack(spacing: 30) {
                                VStack {
                                    Text("It takes time and practice to get a feel for the dough.").bold()
                                    Text("No one can teach you the exact moment the dough is ready. However, until that intuition develops,")
                                    Text("there are characteristics that might help you understand if you’re in the right direction:").bold()
                            }
                                Text("""
 -The dough should be smoother than before-
 -The dough should be less sticky than before-
 -The dough should be hard to knead and elastic, which means you developed a strong gluten-
""")
                                Text("If you feel like your dough is smoother, less sticky and elastic the dough is ready for the bulk process.").bold()


                                
                            }.padding(.horizontal, 5).foregroundColor(.white)
                        )
                    Spacer()
                    ForwardButton(action: { synch.slideShowing -= 2 }, text: "no no, I need the audioguide again...", inSize: g.size, withAdjustment: CGSize(width: 0.5, height: 0.1), color: lightOrange)
                        .frame(maxWidth: g.size.width * 0.55, maxHeight: g.size.height * 0.1)
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "got it!", inSize: g.size, color: lightGreen)
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide9Showing = true }
            .onDisappear { synch.slide9Showing = false }
        }
    }
}

struct Slide9_Previews: PreviewProvider {
    static var previews: some View {
        Slide9()
    }
}
