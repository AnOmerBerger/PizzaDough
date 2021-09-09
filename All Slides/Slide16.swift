//
//  Slide16.swift
//  PizzaDough
//
//  Created by Omer on 6/21/21.
//

import SwiftUI

struct Slide16: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Bulk 6/7")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Bulk", size: g.size)
                VStack(spacing: 60) {
                    Spacer()
                    Text("After you cover the dough,").bold().font(.title2)
                    Text("set a timer for 20 minutes and let the dough rest").bold().font(.title)
                    Spacer()
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "no problem!", inSize: g.size,  color: brightGreen)
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
        }
    }
}

struct Slide16_Previews: PreviewProvider {
    static var previews: some View {
        Slide16()
    }
}
