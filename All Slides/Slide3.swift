//
//  Slide3.swift
//  PizzaDough
//
//  Created by Omer on 6/18/21.
//

import SwiftUI
import SSSwiftUIGIFView

struct Slide3: View {
    @EnvironmentObject var synch: Synchronizer
    var audioGuide = AudioguidePlayer(name: "Autolyze - Audio Guide")
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Autolyzing 1/4")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                
                Spacer()
                HStack(spacing: 20) {
                    Image("Play Symbol")
                    Text("press here to play").font(.title).underline().bold()
                        .onTapGesture { synch.slide3PressPlay.toggle() }
                }
                audioGuide.opacity(synch.slide3PressPlay ? 1.0 : 0.0)
                Spacer()
                SwiftUIGIFPlayerView(gifName: "autolyze-process-example")
                    .padding(.horizontal, 8)
                Spacer()
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 1).frame(maxWidth: g.size.width * 0.5, maxHeight: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.4509803922, blue: 0.01960784314, alpha: 1)))
                    Text("I'm done").foregroundColor(.white).font(.title2)
                        .onTapGesture { synch.slideShowing += 1}
                    }
            }
            .transition(.slide)
            .onAppear { synch.slide3Showing = true }
            .onDisappear { synch.slide3Showing = false }
        }
    }
}

struct Slide3_Previews: PreviewProvider {
    static var previews: some View {
        Slide3().environmentObject(Synchronizer())
    }
}
