import SwiftUI
import Foundation
struct AutoSelect: View {
    @State var dishesdata = solveMaxValue(maxPrice: 0)
    var cardBackground = "background1"
    var star = "🌟"
    @State private var needprice : String = "0"
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    TextField("输入预期大概总价位", text: $needprice).textFieldStyle(.roundedBorder)
                    Button("Auto"){
                        dishesdata = solveMaxValue(maxPrice: Int(needprice) ?? 0)
                    }
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0,style: .continuous))
                }
                List{
                    ForEach(dishesdata){item in
                        NavigationLink(destination:ContentView(name: item.name,canteen: item.canteen,img: item.img,info: item.info)){
                            HStack{
                                VStack {
                                    HStack {
                                        Text("航味:\(item.name)  价格:\(String(format: "%.2f", item.price))")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("评分:\(item.score)")
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                    }
                }
                HStack {
                    Text("                    航味已生成，快去尝试吧！").foregroundColor(.blue)
                    
                    Spacer()
                }
                .background(.orange)
                .cornerRadius(10)
                Spacer()
            }
            .padding()
            .navigationTitle("生成航味")
            
            
        }
    }
}

struct AutoSelect_Previews: PreviewProvider {
    static var previews: some View {
        AutoSelect()
    }
}
