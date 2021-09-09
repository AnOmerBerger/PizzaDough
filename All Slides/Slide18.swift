//
//  Slide18.swift
//  PizzaDough
//
//  Created by Omer on 6/21/21.
//

import SwiftUI

struct Slide18: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                VStack {
                    Text("Great job on completing the pizza dough lesson!").bold().font(.title)
                    Spacer()
                    Text("In this lesson you learned about autolyzing, kneading and bulk.").bold().font(.title2)
                    Spacer()
                    Text("You also learned about the 4 ingredients in pizza dough. Flour which has gluten and enzymes, water that activates the gluten and enzymes, yeast that makes the dough rise, and salt which gives the dough flavor").bold()
                    Spacer()
                    Color(#colorLiteral(red: 0.8156862745, green: 0.4509803922, blue: 0.01960784314, alpha: 1))
                        .frame(maxHeight: g.size.height * 0.25)
                        .overlay(
                            Text("In \(synch.calculator.proofTime?.rawValue ?? "TBD") hours your dough will be ready for the balling process. So check back here 15 minutes before it's time to make the dough balls.").bold().font(.title2).foregroundColor(.white).padding(.horizontal, 8)
                        )
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
        }
    }
}

struct Slide18_Previews: PreviewProvider {
    static var previews: some View {
        Slide18().environmentObject(Synchronizer())
    }
}
