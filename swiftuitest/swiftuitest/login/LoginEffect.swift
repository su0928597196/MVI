//
//  LoginRepository.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import Foundation

class LoginEffect {
    func loginProccess(account: String) -> LoginResult? {
        let response = "{ \"token\": \"jwt\", \"account\": \"\(account)\" }"
        let data = response.data(using: .utf8)
        do {
            let projects = try JSONDecoder().decode(LoginResult.self, from: data!)
            return projects
        } catch {
            
        }
        
        return nil
    }
}
