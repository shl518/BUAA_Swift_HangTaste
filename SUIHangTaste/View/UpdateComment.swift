////
////  UpdateComment.swift
////  SUIHangTaste
////
////  Created by Shl on 2022/10/4.
////
//
//import SwiftUI
//import Combine
//
//class UpdateComment : ObservableObject {
//    var didChange = PassthroughSubject<Void,Never>()
//
//    @Published  var updates: [Comment]{
//            didSet {
//                didChange.send()
//            }
//        }
//    init(updates:[Comment] = []){
//        self.updates = updates
//
//    }
//}
