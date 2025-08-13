//
//  MainView.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        switch router.currentView {
        case .login:
            LoginView()
        case .home:
            let loginInfoModel = LoginInfoModel()
            HomeView().environmentObject(loginInfoModel)
        }
    }
}
