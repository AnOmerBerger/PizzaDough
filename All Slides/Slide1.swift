//
//  Slide1.swift
//  PizzaDough
//
//  Created by Omer on 6/17/21.
//

import SwiftUI

struct Slide1: View {
    @EnvironmentObject var synch: Synchronizer
    @State var inView: Bool = true
    @State var showCalculator: Bool = false
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            ZStack { //popover view once button at bottom has been tapped
                RoundedRectangle(cornerRadius: 1).foregroundColor(Color(#colorLiteral(red: 0.8, green: 0.4549019608, blue: 0.4549019608, alpha: 0.8002338536))).padding()
                Image(systemName: "xmark.circle").imageScale(.large).frame(width: 360, height: 280, alignment: .topLeading)
                    .onTapGesture { synch.slide1NextStepPlease = false }
                VStack {
                    Spacer()
                    Text("""
OH! you are so polite!
got all the ingredients?
""").bold()
                    Text("""
\(synch.calculator.flour ?? 0) grams flour
\(String(format: "%0.1f", synch.calculator.waterAmount ?? 0)) grams water
\(String(format: "%0.2f", synch.calculator.yeast?.amount ?? 0)) grams yeast
\(String(format: "%0.2f", synch.calculator.saltAmount ?? 0)) grams salt

""")
                    Text("And the following tools-").bold()
                    Text("""
A workspace
A large mixing bowl
A towel for your hands
A plastic bag/ large towel to cover the mixing bowl
""")
                    ForwardButton(action: { synch.slideShowing += 1 }, text: "Got it!", inSize: CGSize(width: 180, height: 40), withAdjustment: CGSize(width: 1, height: 1), color: lightOrange)
                }
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .multilineTextAlignment(.center).foregroundColor(bodyTextColor)
            }
            .frame(maxWidth: .infinity, maxHeight: 380)
            .zIndex(1)
            .opacity(synch.slide1NextStepPlease ? 1 : 0)
            
            
            GeometryReader { g in // the view that's first in sight
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 1).frame(maxWidth: g.size.width * 0.9, maxHeight: g.size.height * 0.08).foregroundColor(darkOrange)
                            Text("Welcome to lesson 1: pizza dough").foregroundColor(.white).font(.title2)
                        }.padding()
                        ScrollView {
                            VStack {
                                LineSaver()
                                Spacer()
                                Text("""

Weigh and set aside each ingredient in separate containers.

""").bold()
                                if synch.calculator.flour != nil {
                                    Text("""
For \(synch.calculator.numberOfPizzas!) pizzas of \(synch.calculator.pizzaWeight!) grams each use:

\(synch.calculator.flour!) grams flour
\(String(format: "%0.1f", synch.calculator.waterAmount!)) grams water
\(String(format: "%0.2f", (synch.calculator.yeast?.amount!)! as Double)) grams yeast
\(String(format: "%0.2f", synch.calculator.saltAmount!)) grams salt

Total fermentation time would be \(synch.calculator.proofTime!.rawValue). Use ice cold water - \(synch.calculator.waterTemp!.rawValue).
Your bulk time would be 14 hours, and then 6 hours for balls.

""").bold().foregroundColor(.black)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 38.0).foregroundColor(Color(#colorLiteral(red: 0.7052768067, green: 0.8236132914, blue: 1, alpha: 0.7712965201)).opacity(0.75)))
                                        .layoutPriority(100)
                                }
                                Spacer()
                                ForwardButton(action: { showCalculator = true }, text: "Open Calculator", inSize: g.size, color: lightGreen.opacity(0.85))
                                Spacer()
                                Text("""

Before you begin, we recommend that you put the computer near the workspace and make sure the volume is up
When you’re ready to start, go to the next step.
""")
                                ForwardButton(action: {
                                    if synch.calculator.flour != nil {
                                        synch.slide1NextStepPlease = true
                                    } else {
                                        showAlert = true
                                    }
                                }, text: "next step please", inSize: g.size, color: lightOrange) //brings the popover view
                            }
                        }
                    }
                    .multilineTextAlignment(.center).foregroundColor(bodyTextColor)
                    .frame(maxWidth: g.size.width, maxHeight: g.size.height, alignment: .center)
                    .padding(.horizontal, 8)
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Calculate Recipe!"), message: Text("You must open the calculater and fill it out before continuing"), dismissButton: .cancel())
        })
        .sheet(isPresented: $showCalculator, content: {
            CalculatorSheet(showCalculator: $showCalculator)
        })
//        .onAppear { inView = true }
//        .onDisappear { inView = false }
        .transition(.slide)
    }
}


struct CalculatorSheet: View {
    @EnvironmentObject var synch: Synchronizer
    @Binding var showCalculator: Bool
    @State var numberOfPizzas: Int?
    @State var flour: Int?
    @State var waterRatio: Double?
    @State var saltRatio: Double?
    @State var yeastType: String?
    @State var tempSystem: String?
    @State var waterTemp: String?
    @State var proofTime: String?
    @State var proofTemp: String?
    @State var pizzaWeight: Int?
    @State var kneading: String?
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    ZStack {
                        Color(#colorLiteral(red: 1, green: 0.8916557603, blue: 0.7948918597, alpha: 1)).opacity(0.8)
                        VStack {
                            Text("Enter the ingredients below to recieve your custom recipe!").font(.title3).bold()
                        }
                        .foregroundColor(bodyTextColor)
                        .multilineTextAlignment(.center)
                        .padding()
                    }
                    .frame(maxHeight: 100)
                    Form {
                        Section(header: Text("Ingredients")) {
                            TypedInputs(flour: $flour, waterRatio: $waterRatio, saltRatio: $saltRatio)
                            Picker(selection: $numberOfPizzas, label: Text("Number of Pies*")) {
                                Text("None").tag(nil as Int?)
                                ForEach(1..<100) {
                                    Text("\($0)").tag($0 as Int?)
                                    }
                                }
                            Picker(selection: $yeastType, label: Text("Yeast Type*")) {
                                Text("None").tag(nil as String?)
                                ForEach(0..<YeastType.allCases.count) {
                                    Text("\(YeastType.allCases[$0].rawValue)").tag(YeastType.allCases[$0].rawValue as String?)
                                    }
                                }
                            Picker(selection: $pizzaWeight, label: Text("Pizza Weight")) {
                                Text("None").tag(nil as Int?)
                                ForEach(Array(stride(from: 250, through: 330, by: 5)), id: \.self) {
                                    Text("\($0)").tag($0 as Int?)
                                    }
                                }
                            Picker(selection: $proofTemp, label: Text("Prooving Temprature")) {
                                Text("None").tag(nil as String?)
                                ForEach(0..<ProofTemp.allCases.count) {
                                    Text("\(ProofTemp.allCases[$0].rawValue)").tag(ProofTemp.allCases[$0].rawValue as String?)
                                    }
                                }
                            Picker(selection: $proofTime, label: Text("Prooving Time")) {
                                Text("None").tag(nil as String?)
                                ForEach(0..<ProofTime.allCases.count) {
                                    Text("\(ProofTime.allCases[$0].rawValue)").tag(ProofTime.allCases[$0].rawValue as String?)
                                    }
                                }
                            Picker(selection: $waterTemp, label: Text("Water Temprature")) {
                                Text("None").tag(nil as String?)
                                ForEach(0..<WaterTemp.allCases.count) {
                                    Text("\(WaterTemp.allCases[$0].rawValue)").tag(WaterTemp.allCases[$0].rawValue as String?)
                                    }
                                }
                            Picker(selection: $kneading, label: Text("Kneading Style")) {
                                Text("None").tag(nil as String?)
                                ForEach(0..<Kneading.allCases.count) {
                                    Text("\(Kneading.allCases[$0].rawValue)").tag(Kneading.allCases[$0].rawValue as String?)
                                    }
                                }
                        }
                        ZStack {
                            lightGreen.opacity(0.22)
                            Button(action: {
                                if flour != nil && numberOfPizzas != nil && yeastType != nil && waterRatio != nil && saltRatio != nil {
                                    synch.calculator.calculate(flour: flour!, numberOfPizzas: numberOfPizzas!, waterRatio: waterRatio!, saltRatio: saltRatio! ,yeast: YeastType(rawValue: yeastType!)!, tempSystem: tempSystem, waterTemp: waterTemp, proofTime: proofTime, proofTemp: proofTemp, pizzaWeight: pizzaWeight, kneading: kneading)
                                    showCalculator = false
                                }
                            }) {
                                Text("CALCULATE YOUR RECIPE!").bold().foregroundColor(darkGreen)
                            }
                        }
                        HStack {
                            Spacer()
                            Text("* = required field")
                            Spacer()
                        }
                        Section(header: Text("Presets")) {
                            HStack {
                                Text("1 pizza").onTapGesture {
                                    numberOfPizzas = 1 ; flour = 300 ; waterRatio = 60 ; saltRatio = 2.6 ; proofTemp = ProofTemp.roomTempLow.rawValue ; yeastType = YeastType.fresh.rawValue
                                }
                                Divider()
                                Text("2 pizzas").onTapGesture {
                                    numberOfPizzas = 2 ; flour = 275 ; waterRatio = 62 ; saltRatio = 2.7 ; proofTemp = ProofTemp.roomTempHigh.rawValue ; yeastType = YeastType.sourdough.rawValue
                                }
                                Divider()
                                Text("3 pizzas").onTapGesture {
                                    numberOfPizzas = 3 ; flour = 310 ; waterRatio = 58 ; saltRatio = 2.2 ; proofTemp = ProofTemp.cold.rawValue ; yeastType = YeastType.fresh.rawValue
                                }
                                Divider()
                                Text("6 pizzas").onTapGesture {
                                    numberOfPizzas = 6 ; flour = 1000 ; waterRatio = 60 ; saltRatio = 2.7 ; proofTemp = ProofTemp.cold.rawValue ; yeastType = YeastType.fresh.rawValue ; waterTemp = WaterTemp.low.rawValue ; proofTime = ProofTime.medium.rawValue
                                }
                            }
                        }
                    }
                }
                .padding()
                .navigationBarTitle("Pizza Dough Calculator")
                .navigationBarItems(leading: Button(action: { showCalculator = false }) {
                    Text("Cancel")
                })
            }
        }
        .onAppear() {
            numberOfPizzas = synch.calculator.numberOfPizzas ; flour = synch.calculator.flour ; waterRatio = synch.calculator.waterRatio ; saltRatio = synch.calculator.saltRatio ; pizzaWeight = synch.calculator.pizzaWeight ; yeastType = synch.calculator.yeast?.type?.rawValue ; tempSystem = synch.calculator.tempSystem?.rawValue ; waterTemp = synch.calculator.waterTemp?.rawValue ; proofTime = synch.calculator.proofTime?.rawValue ; proofTemp = synch.calculator.proofTemp?.rawValue ; kneading = synch.calculator.kneading?.rawValue
        }

    }
}
struct TypedInputs: View { // Just helping out the compiling
    @Binding var flour: Int?
    @Binding var waterRatio: Double?
    @Binding var saltRatio: Double?
    
    var body: some View {
        HStack {
            Text("Flour*")
            Divider()
            TextField("(in grams)", value: $flour, formatter: NumberFormatter())
        }
        HStack {
            Text("Water*")
            Divider()
            TextField("(in %)", value: $waterRatio, formatter: DoubleFormatter())
            Text("Salt*")
            Divider()
            TextField("(in %)", value: $saltRatio, formatter: DoubleFormatter())
        }
    }
}

struct LineSaver: View { // Just helping out the compiling
    var body: some View {
        Text("""
In the next few hours you’re going to learn how to make a
""")
        Text("perfect neapolitan pizza dough.").bold()
        Text("""
There are three things you will need to learn in order to make this dough:

-Mixing water and flour and autolisis-
-Kneading-
-Bulk - Turning the dough into a ball-
""")

        Text("""

Before beginning it’s important to prepare everything in advance
so now is the time to gather the ingredients and prepare a workstation.

First of all, prepare your workstation:
""").bold()
        Text("""
A workspace -  a table you can work on and get dirty with flour
A large mixing bowl
A towel for your hands
A plastic bag/ towel to cover the mixing bowl
A kitchen weight scale
Two cups/ bowls/ containers - each one should be enough for half a glass of water

""")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Slide1().environmentObject(Synchronizer())
        }
    }
}

let doughWeightRange = [200, 210, 220, 230, 240, 250, 260, 270, 280]



