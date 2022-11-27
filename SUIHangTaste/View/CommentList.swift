////
////  CommentList.swift
////  SUIHangTaste
////
////  Created by Shl on 2022/11/3.
////
//
//import SwiftUI
//
//struct CommentList: View {
//    var comment = comments
//    var body: some View {
//        VStack(alignment: .trailing){
//            List(comment){ item in
//                NavigationLink(destination: commentDetails(date: item.date, text: item.text, user: item.auser)) {
//                    VStack(alignment: .leading) {
//                        Text(item.date)
//                            .font(.headline)
//                            .fontWeight(.bold)
//                        Text(item.text)
//                            .lineSpacing(4)
//                            .font(.subheadline)
//                            .lineLimit(2)
//                        Text(item.auser)
//                            .font(.caption)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.gray)
//                        
//                    }
//                    
//                }
//            }
//        }
//    }
//}
//struct CommentList_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentList()
//    }
//}
