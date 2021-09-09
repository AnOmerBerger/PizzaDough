//
//  Slide11.swift
//  PizzaDough
//
//  Created by Omer on 6/20/21.
//

import SwiftUI

struct Slide11: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Bulk 1/7")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Bulk", size: g.size)
                ScrollView {
                    VStack(spacing: 30) {
                        Spacer()
                        Text("Now we need to form our dough into one large cohesive ball").bold().layoutPriority(2)
                        Text("""
    This process is called bulking, and the dough ball is referred to as a bulk
    A bulk should be as round, tall and dense as possible

    """).layoutPriority(2)
                        Text("Follow these steps:").bold().font(.title)
                        Text("""
    Go ahead and place your dough on the working space, try to create a bulk in any way you please.
    At this point we just want you to get a feel for it, so just try something out and see how the dough responds
    """).bold().frame(minHeight: 170)
                        Spacer()
                        Group {
                            if g.size.width<g.size.height {
                                Spacer()
                            }
                        }
                        ForwardButton(action: { synch.slideShowing += 1 }, text: "next", inSize: g.size, color: lightOrange).layoutPriority(2)
                    }
                    .padding(.horizontal, 8)
                    .multilineTextAlignment(.center)
                    .foregroundColor(bodyTextColor)
                }
            }
        }
    }
}

struct Slide11_Previews: PreviewProvider {
    static var previews: some View {
        Slide11()
    }
}
