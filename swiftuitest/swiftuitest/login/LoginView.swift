//
//  ContentView.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var router: Router
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack {
                TextField("請輸入帳號", text: $loginViewModel.account)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.center)
                    .padding()
                    .onChange(of: loginViewModel.account) { oldValue, newValue in
                        loginViewModel.send(intent: .changeAccountTextField(newValue))
                    }
                
                Button{
                    loginViewModel.send(intent: .clickLoginButton)
                }label: {
                    Text("登入")
                }
            }
            .padding()
            .onChange(of: loginViewModel.state, { oldValue, newValue in
                if case .failed(let msg) = newValue {
                    loginViewModel.errorMsg = msg
                    loginViewModel.isShowAlert = true
                }
                
                if case .success(_) = newValue {
                    router.currentView = .home
                }
            })
            .alert(loginViewModel.errorMsg,isPresented: $loginViewModel.isShowAlert) {
                Button("OK") {
                    loginViewModel.send(intent: .errorAlertOk)
                }
            }
            
            if case .loading = loginViewModel.state {
                ProgressView()
            }
        }
    }
}

#Preview {
    LoginView()
}
