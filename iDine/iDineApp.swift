//
//  iDineApp.swift
//  iDine
//
//  Created by Mohamed Sarhan on 01/08/2022.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(order)
        }
    }
}
