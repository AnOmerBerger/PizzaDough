//
//  Slide15.swift
//  PizzaDough
//
//  Created by Omer on 6/21/21.
//

import SwiftUI

struct Slide15: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Bulk 5/7")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Bulk", size: g.size)
                VStack(spacing: 20) {
                    Text("sometimes you need to try again until you feel it’s perfect").bold().font(.title2)
                    Text("Even if you made the bulk correctly, the bulk will not be as smooth as the one in this picture.").bold().font(.title)
                    Text("This is because as the gluten network develops it creates a smoother and smoother dough. To achieve this smoothness the dough needs to be kneaded and bulk again and again")
                    Text("Once you have a dense ball cover the bowl with a towel or bag").bold().font(.title)
                    Text("You can check the density by poking the dough and observing if it springs back or stays dented. If the dough springs back, you’re good to go.")
                    Spacer()
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "next", inSize: g.size,  color: lightOrange)
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide15Showing = true }
            .onDisappear { synch.slide15Showing = false }
        }
    }
}

struct Slide15_Previews: PreviewProvider {
    static var previews: some View {
        Slide15()
    }
}
