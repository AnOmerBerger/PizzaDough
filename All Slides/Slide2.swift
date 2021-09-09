//
//  Slide2.swift
//  PizzaDough
//
//  Created by Omer on 6/17/21.
//

import SwiftUI

struct Slide2: View {
    @EnvironmentObject var synch: Synchronizer
    @State var inView: Bool = false
    @State var checkmarkAlert: Bool = false
    
    var body: some View {
        GeometryReader { g in
        VStack {
            HStack {
                Button(action: { synch.slideShowing -= 1 }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 1).frame(maxWidth: 80, maxHeight: 30, alignment: .leading).foregroundColor(lightOrange)
                        Text("back").foregroundColor(.white).font(.title2)
                    }
                }
            }
            .frame(maxWidth: g.size.width, maxHeight: g.size.height * 0.04, alignment: .topLeading)
            .padding(.horizontal, 5)
            VStack(spacing: 35) {
                SectionTitle(text: "Autolyzing", size: g.size)
                ScrollView {
                    VStack(spacing: 35) {
                        Text("In this step you will complete the first step of making a pizza - autolyzing the dough").bold()
                        Text("Follow these steps:").font(.largeTitle).foregroundColor(Color(#colorLiteral(red: 0.9882352941, green: 0.05490196078, blue: 0.05490196078, alpha: 1)))
                        
                        HStack {
                            Image(systemName: synch.slide2Check1 ? "checkmark.circle.fill" : "checkmark.circle").imageScale(.large).foregroundColor(synch.slide2Check1 ? .green : darkOrange)
                                .onTapGesture { synch.slide2Check1.toggle() }
                            Text("Weigh \(String(format: "%0.1f", synch.calculator.waterAmount ?? 0)) grams of water and \(synch.calculator.flour ?? 0) grams of flour in separate containers")
                        }
                        HStack {
                            Image(systemName: synch.slide2Check2 ? "checkmark.circle.fill" : "checkmark.circle").imageScale(.large).foregroundColor(synch.slide2Check2 ? .green : darkOrange)
                                .onTapGesture { synch.slide2Check2.toggle() }
                            Text("Pour a small portion of the water into two seperate small bowls or glasses (about a quarter cup, this doesn’t need to be exact). Set aside for later.")
                        }
                        
                        Text("Pour the remaining water and flour into a bowl.").bold()
                        Text("Ready to get messy?")
                        Text("Follow this audio guide to learn all about autolyzing, and remember - only use one hand!").bold()
                        Image("Play Symbol").onTapGesture {
                            if synch.slide2Check1 && synch.slide2Check2 {
                                synch.slideShowing += 1
                            } else {
                                checkmarkAlert = true
                            }
                        }
                        }
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 8)
                        .foregroundColor(bodyTextColor)
                    }
                }
            }
        .alert(isPresented: $checkmarkAlert, content: {
            Alert(title: Text("Check-off Steps"), message: Text("You must check both of the above steps before continuing"), dismissButton: .cancel())
        })
//        .onAppear { inView = true }
//        .onDisappear { inView = false }
//        .offset(x: inView ? 0 : -(g.size.width + 100))
        .transition(.slide)
        .onAppear { synch.slide2Showing = true }
        .onDisappear { synch.slide2Showing = false }
        }
    }
}

struct Slide2_Previews: PreviewProvider {
    static var previews: some View {
        Slide2().environmentObject(Synchronizer())
    }
}
