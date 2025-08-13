//
//  LoginReducer.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/8/1.
//

import Foundation

class LoginReducer {
    static func send(intent: LoginIntent) -> LoginState {
        switch intent {
        case .clickLoginButton:
            return .loading
        case .loginSuccess(let result):
            return .success(result)
        case .loginFail(let errorMsg):
            return .failed(errorMsg)
        default:
            return .idle
        }
    }
}
