//
//  Synchronizer.swift
//  PizzaDough
//
//  Created by Omer on 6/17/21.
//

import Foundation

class Synchronizer: ObservableObject {
    @Published var slideShowing: Int = 1 {
        willSet {
            print(newValue)
        }
    }
    @Published var calculator = DoughCalculator()
    
    
    
    //Mark: - specific slide properties
    @Published var slide1NextStepPlease: Bool = false
    @Published var slide2Check1: Bool = false
    @Published var slide2Check2: Bool = false
    @Published var slide3PressPlay: Bool = false
    
    
    //Mark: - tracking slides as they appear and disappear
    @Published var slide2Showing: Bool = false
    @Published var slide3Showing: Bool = false
    @Published var slide4Showing: Bool = false
    @Published var slide5Showing: Bool = false
    @Published var slide6Showing: Bool = false
    @Published var slide7Showing: Bool = false
    @Published var slide8Showing: Bool = false
    @Published var slide9Showing: Bool = false
    @Published var slide10Showing: Bool = false
    @Published var slide11Showing: Bool = false
    @Published var slide12Showing: Bool = false
    @Published var slide13Showing: Bool = false
    @Published var slide14Showing: Bool = false
    @Published var slide15Showing: Bool = false
}









//@Published var numberOfPizzas: Int?
//@Published var flour: Int?
//@Published var water: Double?
//@Published var salt: Double?
//@Published var yeast: Yeast?
//@Published var proofTemp: ProofTemp?
//
//func calculate(flour: Int, yeast: String?, numberOfPizzas: Int, proofTemp: ProofTemp?) {
//    self.flour = flour
//    self.numberOfPizzas = numberOfPizzas
//    self.water = Double(flour) * 0.6
//    self.salt = Double(flour) * 0.027
//    self.proofTemp = proofTemp
//    if let yeastName = yeast {
//        self.yeast = Yeast(type: YeastType(rawValue: yeastName), amount: Double(flour) * 0.001)
//    } else {
//        self.yeast = Yeast(type: YeastType.fresh, amount: Double(flour) * 0.001)
//    }
//}
