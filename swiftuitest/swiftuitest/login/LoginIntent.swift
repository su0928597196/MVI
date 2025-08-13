//
//  LoginIntent.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/8/1.
//

import Foundation

enum LoginIntent {
    case changeAccountTextField(String)
    case clickLoginButton
    case errorAlertOk
    case loginSuccess(LoginResult)
    case loginFail(String)
}
