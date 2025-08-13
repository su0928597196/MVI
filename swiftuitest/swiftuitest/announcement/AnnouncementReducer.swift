//
//  AnnouncementReducer.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/8/7.
//

import Foundation

class AnnouncementReducer {
    static func send(intent: AnnouncementIntent) -> AnnouncementState {
        switch intent {
        case .loadData:
            return .loading
        case .loadDataSuccess(let result):
            return .success(result)
        case .loadDataFail(let errorMsg):
            return .failed(errorMsg)
        default:
            return .normal
        }
    }
}
