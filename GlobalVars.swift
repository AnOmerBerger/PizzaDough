//
//  GlobalVars.swift
//  PizzaDough
//
//  Created by Omer on 6/17/21.
//

import Foundation
import SwiftUI


// MARK: - Colors
let bodyTextColor: Color = Color(#colorLiteral(red: 0.9647058824, green: 0.4549019608, blue: 0.4549019608, alpha: 1))
let darkOrange: Color = Color(#colorLiteral(red: 0.8156862745, green: 0.4509803922, blue: 0.01960784314, alpha: 1))
let lightOrange: Color = Color(#colorLiteral(red: 0.9411764706, green: 0.6431372549, blue: 0.2941176471, alpha: 1))
let darkGreen: Color = Color(#colorLiteral(red: 0.1568627451, green: 0.5254901961, blue: 0.02745098039, alpha: 1))
let lightGreen: Color = Color(#colorLiteral(red: 0.1019607843, green: 0.7058823529, blue: 0.09019607843, alpha: 1))
let brightGreen: Color = Color(#colorLiteral(red: 0.1764705882, green: 0.8235294118, blue: 0.07058823529, alpha: 1))
let backgRed: Color = Color(#colorLiteral(red: 0.7960784314, green: 0.1490196078, blue: 0.1490196078, alpha: 0.780695631))
let seeThruRed: Color = Color(#colorLiteral(red: 0.8, green: 0.4549019608, blue: 0.4549019608, alpha: 0.8002338536))


//MARK: - structs

struct BackButton: View {
    let action: () -> Void
    let maxWidth: CGFloat
    let maxHeight: CGFloat
    let alignment: Alignment
    let color: Color
    
    init(action: @escaping () -> Void, maxWidth: CGFloat = 80, maxHeight: CGFloat = 30, alignment: Alignment = .leading, color: Color = lightOrange) {
        self.action = action
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.alignment = alignment
        self.color = color
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 1).frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: .leading).foregroundColor(color)
                Text("back").foregroundColor(.white).font(.title2)
            }
        }
    }
}

struct ForwardButton: View {
    let action: () -> Void
    let text: String
    let size: CGSize
    let withAdjustment: CGSize
    let color: Color
    
    init(action: @escaping () -> Void, text: String, inSize size: CGSize, withAdjustment: CGSize = CGSize(width: 0.5, height: 0.06), color: Color) {
        self.action = action
        self.text = text
        self.size = size
        self.withAdjustment = withAdjustment
        self.color = color
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 1).frame(maxWidth: size.width * withAdjustment.width, maxHeight: size.height * withAdjustment.height).foregroundColor(color)
                Text(text).foregroundColor(.white).font(.title2).bold()
            }
        }
    }
}

struct SectionTracker: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 1).frame(maxWidth: 160, maxHeight: 50, alignment: .bottom).foregroundColor(lightOrange)
            Text(text).foregroundColor(.white).font(.title2)
        }
    }
    
}

struct SectionTitle: View {
    let text: String
    let size: CGSize
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 1).frame(maxWidth: size.width * 0.7, maxHeight: size.height * 0.07).foregroundColor(darkOrange)
            Text(text).foregroundColor(.white).font(.title2)
        }
    }
}

struct LoadView: View {
    var body: some View {
        VStack {
            Image("pizza-icon").resizable().frame(width: 100, height: 100, alignment: .center)
                .spinning()
            Text("Loading...")
        }
    }
}

//Mark: - View Modifiers
struct Spinning: ViewModifier {
    @State var isVisible: Bool = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isVisible ? 720 : 0))
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            .onAppear { isVisible = true }
    }
}

extension View {
    func spinning() -> some View {
        self.modifier(Spinning())
    }
}
