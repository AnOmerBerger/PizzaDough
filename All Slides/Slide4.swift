//
//  Slide4.swift
//  PizzaDough
//
//  Created by Omer on 6/18/21.
//

import SwiftUI

struct Slide4: View {
    @EnvironmentObject var synch : Synchronizer
    @State var itsTheSame: Bool = false
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: itsTheSame ? "Autolyzing 3/4" : "Autolyzing 2/4")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                VStack {
                    Text("Take a moment to compare the dough in this picture to your own dough. They should be similar.").bold()
                    Text("""
Notice how the water and flour are completely combined
No dry bits of flour
No water floating around the dough

""")
                    Text(" If your dough is different, mix the dough again until cohesive.").bold()
                        Image("finished-autolyze-example")
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            ZStack {
                                Color(#colorLiteral(red: 0.7960784314, green: 0.1490196078, blue: 0.1490196078, alpha: 0.780695631))
                                Text("""
Congratulations!
you now completed the first part of making a neapolitan pizza - autolyzing.
""")
                                    .foregroundColor(.white).bold()
                                    .padding(.horizontal, 5)
                            }.opacity(itsTheSame ? 1 : 0)
                        )
                    Spacer()
                    ZStack {
                        if !itsTheSame {
                            RoundedRectangle(cornerRadius: 1).frame(maxWidth: g.size.width * 0.5, maxHeight: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.4509803922, blue: 0.01960784314, alpha: 1)))
                            Text("it's the same!").foregroundColor(.white).font(.title2)
                                .onTapGesture { itsTheSame = true }
                        } else {
                            RoundedRectangle(cornerRadius: 1).frame(maxWidth: g.size.width * 0.7, maxHeight: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.1568627451, green: 0.5254901961, blue: 0.02745098039, alpha: 1)))
                            Text("ready for the next step").foregroundColor(.white).font(.title2)
                                .onTapGesture { synch.slideShowing += 1 }
                        }
                    }
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide4Showing = true }
            .onDisappear { synch.slide4Showing = false }
        }
    }
}

struct Slide4_Previews: PreviewProvider {
    static var previews: some View {
        Slide4()
    }
}
