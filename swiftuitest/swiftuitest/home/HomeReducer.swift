//
//  HomeReducer.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/8/7.
//

import Foundation

class HomeReducer {
    static func send(intent: HomeIntent) -> HomeState {
        switch intent {
        case .clickLogoutButton:
            return .logout
        case .goToAnnouncement:
            return .goToAnnouncement
        default:
            return .normal
        }
    }
}
