//
//  Slide13.swift
//  PizzaDough
//
//  Created by Omer on 6/21/21.
//

import SwiftUI
import SSSwiftUIGIFView

struct Slide13: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Bulk 3/7")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Bulk", size: g.size)
                VStack(spacing: 40) {
                    Spacer()
                    Text("Poke your bulk, is it as springy as our bulk?").bold().font(.title)
                    SwiftUIGIFPlayerView(gifName: "poke-bulk")
                    Spacer()
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "not so much", inSize: g.size, color: lightOrange)
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "oh it's even better", inSize: g.size, color: lightOrange)
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide13Showing = true }
            .onDisappear { synch.slide13Showing = false }
        }
    }
}

struct Slide13_Previews: PreviewProvider {
    static var previews: some View {
        Slide13()
    }
}
