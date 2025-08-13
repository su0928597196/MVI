//
//  AnnouncementModel.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import Foundation

struct AnnouncementResult: Codable, Equatable {
    var announcements: [Announcement]?
}

struct Announcement: Codable, Identifiable, Equatable{
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
