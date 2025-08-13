//
//  LoginState.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/8/1.
//

import Foundation

enum LoginState: Equatable {
    case idle
    case loading
    case success(LoginResult)
    case failed(String)
}
