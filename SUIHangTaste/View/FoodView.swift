import SwiftUI

struct FoodView: View {
    var dishname:String = "蒜香猪肘"
    var canteen:String = "学二"
    var img:String = "paigu"
    var background = "background2"
    var score = 1
    var star = "等你来打分!😘"
    var price = "10.0"
    var body: some View {
        VStack {
            VStack() {
                Text(dishname)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.top)
                
                HStack {
                    Text(canteen)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    Text("分数:\(String(repeating: star,count: score))").fontWeight(.bold)
                    Text("价格:\(price)")
                }
            }
            Spacer()
            Image(img).resizable().frame(width: 350.0, height: 200.0)
            
        }
        .background(Color(background))
        .cornerRadius(30)
        .frame(width: 340, height: 280)
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}
