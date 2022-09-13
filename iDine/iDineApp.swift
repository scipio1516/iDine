//
//  iDineApp.swift
//  iDine
//
//  Created by Leo Lai on 9/6/22.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
