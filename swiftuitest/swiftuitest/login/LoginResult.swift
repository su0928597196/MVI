//
//  LoginModel.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import Foundation

struct LoginResult: Codable, Equatable {
    var token: String?
    var account: String?
}
