//
//  AnnouncementState.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/8/7.
//

import Foundation

enum AnnouncementState: Equatable {
    case normal
    case loading
    case success(AnnouncementResult)
    case failed(String)
}
