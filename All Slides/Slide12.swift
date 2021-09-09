//
//  Slide12.swift
//  PizzaDough
//
//  Created by Omer on 6/20/21.
//

import SwiftUI

struct Slide12: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Bulk 2/7")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Bulk", size: g.size)
                VStack(spacing: 40) {
                    Spacer()
                    Text("Compare Your Bulk").bold().font(.title)
                    Text("""
 Look at this model bulk of a pizza we made and compare it to your own.
Notice the shape, height and springiness of a proper bulk and see how it differs from your own.
""").bold()
                    Image("bulk-compare-2").resizable().scaledToFit()
                    Text("Once you are done, put the bulk into the bowl").bold()
                    Spacer()
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "next", inSize: g.size, color: lightOrange)
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide12Showing = true }
            .onDisappear { synch.slide12Showing = false }
        }
    }
}

struct Slide12_Previews: PreviewProvider {
    static var previews: some View {
        Slide12()
    }
}
