//
//  Slide10.swift
//  PizzaDough
//
//  Created by Omer on 6/19/21.
//

import SwiftUI

struct Slide10: View {
    @EnvironmentObject var synch : Synchronizer

    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Kneading 4/4")
                }
                .frame(maxWidth: g.size.width, maxHeight: g.size.height * 0.07, alignment: .topLeading)
                .padding(.horizontal, 5)
                VStack {
                    Spacer()
                    Image("bulk-compare-1").resizable().scaledToFit()
                        .overlay(
                            ZStack {
                                Color(#colorLiteral(red: 0.7960784314, green: 0.1490196078, blue: 0.1490196078, alpha: 0.780695631))
                                Text("""
Congratulations!
you now completed the second part of making a neapolitan pizza - Kneading.

//// more
""").bold().padding(.horizontal, 5)
                            }.foregroundColor(.white)
                        )
                    Spacer()
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "ready for the next step", inSize: g.size, withAdjustment: CGSize(width: 0.7, height: 0.06), color: lightGreen)
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
        }
    }
}

struct Slide10_Previews: PreviewProvider {
    static var previews: some View {
        Slide10()
    }
}
