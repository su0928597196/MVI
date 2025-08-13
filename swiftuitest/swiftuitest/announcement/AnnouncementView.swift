//
//  AnnouncementView.swift
//  swiftuitest
//
//  Created by 林聖諺 on 2025/7/28.
//

import SwiftUI

struct AnnouncementView: View {
//    @Environment(\.dismiss) var dismiss
    @StateObject var announcementViewModel: AnnouncementViewModel = AnnouncementViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                //            Button("返回") {
                //                dismiss()
                //            }
                
                List {
                    if let announcements = announcementViewModel.result?.announcements {
                        ForEach(announcements) { announcement in
                            HStack {
                                Text(announcement.title ?? "")
                                    .padding()
                                Spacer()
                                Button(announcement.body ?? "") {
                                    
                                }.padding()
                            }
                        }
                    } else {
                        EmptyView()
                    }
                }
                .onAppear {
                    announcementViewModel.send(intent: .loadData)
                }
                .alert(announcementViewModel.errorMsg,isPresented: $announcementViewModel.isShowAlert) {
                    Button("OK") {
                        
                    }
                }
                .onChange(of: announcementViewModel.state) { oldValue, newValue in
                    if case .success(_) = newValue {
                        
                    }
                    
                    if case .failed(let errorMsg) = newValue {
                        announcementViewModel.errorMsg = errorMsg
                        announcementViewModel.isShowAlert = true
                    }
                }
                
            }
            .navigationTitle("公告")
            .navigationBarTitleDisplayMode(.inline)
            
            if case .loading = announcementViewModel.state {
                ProgressView()
            }
        }
    }
}

#Preview {
    AnnouncementView()
}
