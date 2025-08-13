//
//  swiftuitestApp.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

@main
struct swiftuitestApp: App {
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(Router())
        }
    }
}
