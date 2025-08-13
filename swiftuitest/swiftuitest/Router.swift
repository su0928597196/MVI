//
//  Router.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

enum views {
    case login
    case home
}

class Router: ObservableObject {
    @Published var currentView: views = UserDefaults.standard.string(forKey: "token") != nil ? .home : .login
}
