//
//  AnnouncementViewModel.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

class AnnouncementViewModel: ObservableObject {
    @Published var state: AnnouncementState = .normal
    @Published var isShowAlert: Bool = false
    @Published var errorMsg: String = ""
//    @Published var isLoading: Bool = false
    @Published var result: AnnouncementResult?
    
    func send(intent: AnnouncementIntent) {
        switch intent {
        case .loadData:
            self.state = AnnouncementReducer.send(intent: intent)
            getAnnouncement()
            break
        case .download:
            self.state = AnnouncementReducer.send(intent: intent)
            break
        case .loadDataSuccess(_):
            self.state = AnnouncementReducer.send(intent: intent)
            break
        case .loadDataFail(_):
            self.state = AnnouncementReducer.send(intent: intent)
            break
        }
    }
    
    func getAnnouncement() {
        let repository = AnnouncementEffect()
        let result = repository.getAnnouncementProccess()
        
        guard let result = result else {
            send(intent: .loadDataFail("連線錯誤"))
            return
        }
        
        self.result = result
        send(intent: .loadDataSuccess(result))
    }
}
