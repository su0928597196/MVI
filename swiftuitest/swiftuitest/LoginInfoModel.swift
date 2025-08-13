//
//  LoginInfoModel.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

class LoginInfoModel: ObservableObject {
    @Published var token: String? = UserDefaults.standard.string(forKey: "token")
    @Published var account: String? = UserDefaults.standard.string(forKey: "account")
}
