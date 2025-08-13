//
//  HomeView.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

enum HomePathEnum: Hashable {
    case home
    case announcement
}

class HomePath: ObservableObject {
    @Published var path: [HomePathEnum] = []
    
    func navigate(to path: HomePathEnum) {
        self.path.append(path)
    }
    func goBack() {
        _ = path.popLast()
    }
    func popToRoot() {
        path.removeAll()
    }
}

struct HomeView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var loginInfoModel: LoginInfoModel
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var path = HomePath()
    
    var body: some View {
        NavigationStack(path: $path.path) {
            VStack {
//                HStack {
//                    Button("登出") {
//                        UserDefaults.standard.set(nil, forKey: "token")
//                        UserDefaults.standard.set(nil, forKey: "account")
//                        router.currentView = .login
//                    }.padding(.leading, 16)
//                    
//                    Spacer()
//                }
//                
//                Spacer()
                
                Text("帳號:" + (loginInfoModel.account ?? ""))
//                NavigationLink("查看公告") {
//                    AnnouncementView()
//                }
                Button {
                    homeViewModel.send(intent: .goToAnnouncement)
                } label: {
                    Text("前往公告")
                }
                
//                Spacer()
            }
            .navigationTitle("首頁")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button("登出") {
                        homeViewModel.send(intent: .clickLogoutButton)
                    }.padding()
                }
            }.onAppear() {
                homeViewModel.send(intent: .onAppear)
            }.onChange(of: homeViewModel.state) { oldValue, newValue in
                if case .logout = newValue {
                    router.currentView = .login
                }
                
                if case .goToAnnouncement = newValue {
                    path.navigate(to: .announcement)
                }
            }
            .navigationDestination(for: HomePathEnum.self) { path in
                if case .announcement = path {
                    AnnouncementView()
                }
            }
        }
        .environmentObject(path)
    }
}

#Preview {
    let loginInfoModel = LoginInfoModel()
    HomeView().environmentObject(loginInfoModel)
}
