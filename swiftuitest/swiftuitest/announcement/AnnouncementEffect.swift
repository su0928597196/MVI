//
//  AnnouncementRepository.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import Foundation

class AnnouncementEffect {
    func getAnnouncementProccess() -> AnnouncementResult? {
        let response = "{\"announcements\": [{\"userId\":1, \"id\":1, \"title\":\"楓之谷\", \"body\":\"下載\"}, {\"userId\":2, \"id\":2, \"title\":\"英雄聯盟\", \"body\":\"下載\"}, {\"userId\":3, \"id\":3, \"title\":\"特戰英豪\", \"body\":\"下載\"}, {\"userId\":4, \"id\":4, \"title\":\"CSGO\", \"body\":\"下載\"}, {\"userId\":5, \"id\":5, \"title\":\"楓之谷阿泰爾\", \"body\":\"下載\"}]}"
        let data = response.data(using: .utf8)
        do {
            let projects = try JSONDecoder().decode(AnnouncementResult.self, from: data!)
            return projects
        } catch {
            
        }
        
        return nil
    }
}
