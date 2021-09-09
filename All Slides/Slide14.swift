//
//  Slide14.swift
//  PizzaDough
//
//  Created by Omer on 6/21/21.
//

import SwiftUI
import SSSwiftUIGIFView

struct Slide14: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Bulk 4/7")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Bulk", size: g.size)
                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                        Group {
                            Text("""
Let’s Learn How To Shape A Proper Bulk
""").bold()
                            Text("""
Try and make the bulk again.
""")
                            Text("""
Place both hands on each side of the dough,
halfway down from the middle on the opposing side.
""").bold()
                            Text("Try and do both actions simultaneously.")
                        }
                        SwiftUIGIFPlayerView(gifName: "bulk-3d")
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .frame(minHeight: 250)
                        SwiftUIGIFPlayerView(gifName: "bulk-hands-movement")
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .frame(minHeight: 250)
                        Text("""
    Pushing the part of the dough you are holding towards the south pole of the ball
    Slightly turning the dough in a circle (around its own axis).
    By pushing the dough inwards you are increasing the density of the ball.
    Turning the bulk on its own axis creates a ball shape and increases its height

""")
                        Spacer()
                        ForwardButton(action: { synch.slideShowing += 1 }, text: "no problem!", inSize: g.size, color: lightOrange)
                    }
                    .padding(.horizontal, 8)
                    .multilineTextAlignment(.center)
                    .foregroundColor(bodyTextColor)
                }
            }
            .onAppear { synch.slide14Showing = true }
            .onDisappear { synch.slide14Showing = false }
        }
    }
}

struct Slide14_Previews: PreviewProvider {
    static var previews: some View {
        Slide14()
    }
}
