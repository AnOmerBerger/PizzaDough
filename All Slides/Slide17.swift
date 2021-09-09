//
//  Slide17.swift
//  PizzaDough
//
//  Created by Omer on 6/21/21.
//

import SwiftUI

struct Slide17: View {
    @EnvironmentObject var synch : Synchronizer
    @State var dismissed: Bool = false
    
    var body: some View {
        GeometryReader { g in
            VStack {
                HStack {
                    BackButton(action: { synch.slideShowing -= 1 })
                    Spacer()
                    SectionTracker(text: "Bulk 7/7")
                }
                .frame(maxHeight: g.size.height * 0.07, alignment: .top)
                .padding(.leading, 5)
                SectionTitle(text: "Bulk", size: g.size)
                ZStack {
                    VStack(spacing: 60) {
                        Spacer()
                        Text("TBD").bold().font(.title)
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 1).frame(maxWidth: g.size.width * 0.5, maxHeight: g.size.height * 0.06).foregroundColor(Color(#colorLiteral(red: 0.9411764706, green: 0.6431372549, blue: 0.2941176471, alpha: 1)))
                            Text("next").foregroundColor(.white).font(.title2)
                                .onTapGesture { synch.slideShowing += 1 }
                        }
                    }
                    .padding(.horizontal, 8)
                    .multilineTextAlignment(.center)
                    .foregroundColor(bodyTextColor)
                    VStack {
                        Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
                            .overlay(
                                GeometryReader { vgeo in
                                    ZStack {
                                        Image(systemName: "xmark.circle").imageScale(.large).foregroundColor(.black)
                                            .frame(width: vgeo.size.width, height: vgeo.size.height, alignment: .topLeading).padding(4)
                                            .onTapGesture { dismissed = true }
                                        Text("""
                In this final step we won’t learn anything new,
                but we’ll finalize the kneading and bulk steps.
                Overall, you will uncover the dough, get it out from the bowl into the working space, knead it for 2-3 more minutes, make it back as a dense ball, put it back in your bowl, cover, and you’re done. While doing all this, try to keep in mind and to pay attention for the following notes:
                Remember how dense your dough was right before the resting time? See how week it seems now. You can also poke the dough and see its weak resistance.
                See how when you knead now the dough, there is no risk of sticking dough on your hands.
                You can see that the dough is much smoother than before.
                When you make the dough back as a balll, see how easier it is to do than before.
                """)
                                            .bold()
                                            .padding(.horizontal, 12)
                                            .frame(width: vgeo.size.width * 0.9, height: vgeo.size.height * 0.9)
                                    }
                                }
                            )
                    }
                    .padding(.horizontal, 8)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.4509803922, blue: 0.01960784314, alpha: 1)))
                    .opacity(dismissed ? 0 : 1)
                }
            }
        }
    }
}

struct Slide17_Previews: PreviewProvider {
    static var previews: some View {
        Slide17()
    }
}
