////
////  FormView.swift
////  SUIHangTaste
////
////  Created by Shl on 2022/10/4.
////
//
//import SwiftUI
//
//struct FormView: View {
//    @State var username = ""
//    @State var text = ""
//    @State private var maxPriceLevel = 5
//    @Binding var showFormView :Bool
//    @Environment(\.managedObjectContext) private var viewcontext
//
//
//
//    private func saveComment(){
//        do{
//            let comment = CommentModel(context: viewcontext)
//            comment.text = text
//            comment.user = "szy"
//            comment.date = Date()
//            try viewcontext.save()
//            showFormView = false
//        }catch{
//            print(error.localizedDescription)
//        }
//    }
//
//    private func currentDate() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        let datetime = formatter.string(from: Date())
//        return datetime
//    }
//
//    var body: some View {
//        NavigationView{
//            Form {
//                Section(
//                    header: Text("菜品评分1～5")
//                    .font(.headline)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.black)
//
//                ){
//
//                    Stepper(
//                        onIncrement: {
//                            self.maxPriceLevel += 1
//
//                            if(self.maxPriceLevel > 5){
//                                self.maxPriceLevel = 5
//                            }
//                        },
//                        onDecrement: {
//                            self.maxPriceLevel -= 1
//
//                            if(self.maxPriceLevel < 1){
//                                self.maxPriceLevel = 1
//                            }
//                        },
//                        label: {
//                            Text(" \(String(repeating: "👍",count: maxPriceLevel))")
//                        })
//                }
//                Text("菜品评价").font(.headline)
//                HStack {
//
//                    //TextEditor(text: $text)
//                    TextField("输入评价", text: $text)
//                }
//                Button(
//                    action: { saveComment() },
//                    label: { Text("提交") }
//                )
//            }.navigationBarTitle(Text("我的评论"))
//        }
//    }
//}
//
//struct FormView_Previews: PreviewProvider {
//    static var previews: some View {
//        FormView(showFormView: false)
//    }
//}
