//
//  LoginViewModel.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var state: LoginState = .idle
    @Published var isShowAlert: Bool = false
    @Published var errorMsg: String = ""
//    @Published var isLoading: Bool = false
    @Published var account: String = ""
    
    func send(intent: LoginIntent) {
        switch intent {
        case .changeAccountTextField(_):
            break
        case .clickLoginButton:
            if account.isEmpty {
                self.state = LoginReducer.send(intent: .loginFail("帳號不能為空"))
                return
            }
            self.state = LoginReducer.send(intent: intent)
            login(account: account)
            break
        case .errorAlertOk:
            self.state = LoginReducer.send(intent: intent)
            break
        case .loginSuccess(_):
            self.state = LoginReducer.send(intent: intent)
            break
        case .loginFail(_):
            self.state = LoginReducer.send(intent: intent)
            break
        }
    }
    
    func login(account: String) {
        let repository = LoginEffect()
        let result = repository.loginProccess(account: account)
        
        guard let result = result else {
            send(intent: .loginFail("帳號錯誤"))
            return
        }
        
        UserDefaults.standard.set(result.token, forKey: "token")
        UserDefaults.standard.set(result.account, forKey: "account")
        send(intent: .loginSuccess(result))
    }
}
