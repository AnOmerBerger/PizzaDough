//
//  Slide6.swift
//  PizzaDough
//
//  Created by Omer on 6/18/21.
//

import SwiftUI
import SSSwiftUIGIFView

struct Slide6: View {
    @EnvironmentObject var synch : Synchronizer
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Kneading 1/4")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Kneading", size: g.size)
                Spacer()
                VStack(spacing: 25) {
                    Text("In this step we are going to add salt and yeast to the dough and knead the dough.").bold()
                    Text("The dough has been resting for the last X minutes and going through autolysis - the process in which starches are turned into sugars. But this lump of simple dough is not yet the pizza dough we want. First of all, two of our ingredients - salt and yeast, are still not part of the dough. The dough is also still lumpy, and can’t be shaped properly. In this step we are going to combine all of the ingredients together and knead the dough until it’s beautiful and smooth.")

                    Text(" Start by dissolving the salt and yeast into the two seperate cups/ bowls of water from before.").bold()
                    HStack {
                        SwiftUIGIFPlayerView(gifName: "salt")
                        Text("Take the salt and pour it into one container. Mix until dissolved, this may take a few minutes. Set aside").foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.4509803922, blue: 0.01960784314, alpha: 1)))
                    }
                    HStack {
                        Text("Pour the yeast into the second water container and mix until the yeast is dissolved. The water will change colors. Set aside").foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.4509803922, blue: 0.01960784314, alpha: 1)))
                        SwiftUIGIFPlayerView(gifName: "yeasts")
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 1).frame(maxWidth: g.size.width * 0.5, maxHeight: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.9411764706, green: 0.6431372549, blue: 0.2941176471, alpha: 1)))
                        Text("ready!").foregroundColor(.white).font(.title2)
                            .onTapGesture { synch.slideShowing += 1 }
                    }
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .foregroundColor(bodyTextColor)
            }
            .onAppear { synch.slide6Showing = true }
            .onDisappear { synch.slide6Showing = false }
        }
    }
}

struct Slide6_Previews: PreviewProvider {
    static var previews: some View {
        Slide6()
    }
}
