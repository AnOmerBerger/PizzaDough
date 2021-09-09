//
//  Slide8.swift
//  PizzaDough
//
//  Created by Omer on 6/19/21.
//

import SwiftUI

struct Slide8: View {
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
                                Text("Take a moment to compare the dough in this picture below to your own dough.They should be similar. ").foregroundColor(.white).bold()
                                Image("dough-comparison").resizable().scaledToFit()
                            }.padding(.horizontal, 5)
                        )
                    Spacer()
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "not quite there yet", inSize: g.size, withAdjustment: CGSize(width: 0.6, height: 0.06), color: lightOrange)
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "it's perfect!", inSize: g.size, color: lightGreen)
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide8Showing = true }
            .onDisappear { synch.slide8Showing = false }
        }
    }
}

struct Slide8_Previews: PreviewProvider {
    static var previews: some View {
        Slide8()
    }
}
