//
//  PizzaDoughApp.swift
//  PizzaDough
//
//  Created by Omer on 6/17/21.
//

import SwiftUI

@main
struct PizzaDoughApp: App {
    let synch = Synchronizer()
    
    var body: some Scene {
        WindowGroup {
            MainView(synch: synch)
        }
    }
}
