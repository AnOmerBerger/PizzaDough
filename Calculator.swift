//
//  Calculator.swift
//  PizzaDough
//
//  Created by Omer on 7/22/21.
//

import Foundation

struct DoughCalculator {
    var flour: Int?
    var waterAmount: Double?
    var waterRatio: Double?
    var saltAmount: Double?
    var saltRatio: Double?
    var yeast: Yeast?
    var tempSystem: TempSystem?
    var waterTemp: WaterTemp?
    var proofTime: ProofTime?
    var exactproofTime: Int?
    var proofTemp: ProofTemp?
    var numberOfPizzas: Int?
    var pizzaWeight: Int?
    var kneading: Kneading?
    
    mutating func calculate(flour: Int, numberOfPizzas: Int, waterRatio: Double, saltRatio: Double ,yeast: YeastType, tempSystem: String?, waterTemp: String?, proofTime: String?, proofTemp: String?, pizzaWeight: Int?, kneading: String?) {
        self.flour = flour
        self.numberOfPizzas = numberOfPizzas
        self.waterRatio = waterRatio
        self.waterAmount = Double(flour) * (waterRatio * 0.01)
        self.saltRatio = saltRatio
        self.saltAmount = Double(flour) * (saltRatio * 0.01)
        self.yeast = Yeast(type: yeast, amount: Double(flour) * 0.001)
        if let system = tempSystem {
            self.tempSystem = TempSystem(rawValue: system)
        } else {
            self.tempSystem = TempSystem.celsius
        }
        if let temprature = waterTemp {
            self.waterTemp = WaterTemp(rawValue: temprature)
        } else {
            self.waterTemp = WaterTemp.medium
        }
        if let time = proofTime {
            self.proofTime = ProofTime(rawValue: time)
        } else {
            self.proofTime = ProofTime.long
        }
        if let temprature = proofTemp {
            self.proofTemp = ProofTemp(rawValue: temprature)
        } else {
            self.proofTemp = ProofTemp.warmer
        }
        self.pizzaWeight = pizzaWeight ?? 275
        if let knead = kneading {
            self.kneading = Kneading(rawValue: knead)
        } else {
            self.kneading = Kneading.hand
        }
    }
}


//Mark: - Custom structs and enums
struct Yeast: Hashable {
    var type: YeastType?
    var amount: Double?
}
enum YeastType: String, CaseIterable, Hashable {
    case fresh = "Fresh Yeast"
    case sourdough = "Sourdough"
}
enum TempSystem: String, CaseIterable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
}
enum WaterTemp: String, CaseIterable {
    case low = "4°C/39°F or below"
    case medium = "5-15°C/41-59°F"
}
enum ProofTemp: String, CaseIterable {
    case warmer = "At or above 20°C/68°F"
    case cooler = "Below 20°C/68°F"
}
enum ProofTime: String, CaseIterable, Hashable {
    case short = "8-12 hours"
    case mediumShort = "13-16 hours"
    case mediumLong = "17-20 hours"
    case long = "21-24 hours"
    case Extralong = "25-28 hours"
}
enum Kneading: String, CaseIterable {
    case hand = "Hand"
    case mixer = "Mixer"
}

