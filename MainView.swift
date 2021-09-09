//
//  MainView.swift
//  PizzaDough
//
//  Created by Omer on 6/17/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var synch: Synchronizer
    
    var body: some View {
        VStack {
            Group {
                if synch.slideShowing == 1 {
                    Slide1().environmentObject(synch)
                } else if synch.slideShowing == 2 {
                    Slide2().environmentObject(synch)
                } else if synch.slideShowing == 3 {
                    if synch.slide2Showing || synch.slide4Showing {
                        LoadView()
                    } else {
                        Slide3().environmentObject(synch)
                    }
                } else if synch.slideShowing == 4 {
                    Slide4().environmentObject(synch)
                } else if synch.slideShowing == 5 {
                    Slide5().environmentObject(synch)
                } else if synch.slideShowing == 6 {
                    if synch.slide5Showing {
                        LoadView()
                    } else {
                        Slide6().environmentObject(synch)
                    }
                } else if synch.slideShowing == 7 {
                    if synch.slide6Showing || synch.slide8Showing || synch.slide9Showing {
                        LoadView()
                    } else {
                        Slide7().environmentObject(synch)
                    }
                } else if synch.slideShowing == 8 {
                    Slide8().environmentObject(synch)
                } else if synch.slideShowing == 9 {
                    Slide9().environmentObject(synch)
                } else if synch.slideShowing == 10 {
                    Slide10().environmentObject(synch)
                } else if synch.slideShowing == 11 {
                    Slide11().environmentObject(synch)
                } else if synch.slideShowing == 12 {
                    Slide12().environmentObject(synch)
                } else if synch.slideShowing == 13 {
                    if synch.slide12Showing || synch.slide14Showing {
                        LoadView()
                    } else {
                        Slide13().environmentObject(synch)
                    }
                } else if synch.slideShowing == 14 {
                    if synch.slide13Showing || synch.slide15Showing {
                        LoadView()
                    } else {
                        Slide14().environmentObject(synch)
                    }
                } else if synch.slideShowing == 15 {
                    Slide15().environmentObject(synch)
                } else if synch.slideShowing == 16 {
                    Slide16().environmentObject(synch)
                } else if synch.slideShowing == 17 {
                    Slide17().environmentObject(synch)
                } else if synch.slideShowing == 18 {
                    Slide18().environmentObject(synch)
                }
            }
        }
        .animation(.linear(duration: 0.8))
        .transition(.slide)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(synch: Synchronizer())
    }
}
