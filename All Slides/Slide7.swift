//
//  Slide7.swift
//  PizzaDough
//
//  Created by Omer on 6/19/21.
//

import SwiftUI
import SSSwiftUIGIFView

struct Slide7: View {
    @EnvironmentObject var synch: Synchronizer
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Kneading 2/4")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                ScrollView {
                    VStack(spacing: 20) {
                        AudioguidePlayer(name: "Kneading - Audio Guide")
                        Text("You're almost ready to get messy again").font(.title).bold().fixedSize(horizontal: false, vertical: true)
                        Text("Like before, follow the audioguide. You can also use the GIFs below as a visual guide to help you understand what to do.").bold().fixedSize(horizontal: false, vertical: true)
                        Text("And remember - use only on hand!")
                        VStack {
                            SwiftUIGIFPlayerView(gifName: "kneading-1")
                            Text("after 1 minute")
                            SwiftUIGIFPlayerView(gifName: "kneading-2")
                            Text("after 5 minutes")
                            SwiftUIGIFPlayerView(gifName: "kneading-3")
                            Text("after 10 minutes")
                        }
                        .frame(width: g.size.width, height: g.size.height * 0.7, alignment: .center)
                        .foregroundColor(.black)
                        ZStack {
                            RoundedRectangle(cornerRadius: 1).frame(width: g.size.width * 0.5, height: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.9411764706, green: 0.6431372549, blue: 0.2941176471, alpha: 1)))
                            Text("need more help?").foregroundColor(.white).font(.title2)
                                .onTapGesture { synch.slideShowing += 1 }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 1).frame(width: g.size.width * 0.5, height: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.9411764706, green: 0.6431372549, blue: 0.2941176471, alpha: 1)))
                            Text("I think I've got it").foregroundColor(.white).font(.title2)
                                .onTapGesture { synch.slideShowing += 1 }
                        }
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(bodyTextColor)
                }
            }
            .onAppear { synch.slide7Showing = true }
            .onDisappear { synch.slide7Showing = false }
        }
    }
}

struct Slide7_Previews: PreviewProvider {
    static var previews: some View {
        Slide7().environmentObject(Synchronizer())
    }
}
