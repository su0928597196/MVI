//
//  AnnouncementIntent.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/8/7.
//

import Foundation

enum AnnouncementIntent {
    case loadData
    case download
    case loadDataSuccess(AnnouncementResult)
    case loadDataFail(String)
}
