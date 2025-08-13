//
//  HomeViewModel.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var state: HomeState = .normal
    
    func send(intent: HomeIntent) {
        switch intent {
        case .onAppear:
            self.state = HomeReducer.send(intent: intent)
            break
        case .goToAnnouncement:
            self.state = HomeReducer.send(intent: intent)
            break
        case .clickLogoutButton:
            logout()
            self.state = HomeReducer.send(intent: intent)
            break
        }
    }
    
    func logout() {
        UserDefaults.standard.set(nil, forKey: "token")
        UserDefaults.standard.set(nil, forKey: "account")
    }
}
