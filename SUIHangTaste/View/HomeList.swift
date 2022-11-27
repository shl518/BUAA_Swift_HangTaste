import SwiftUI

struct HomeList: View {
    var dishesdata = newdishes
    var cardBackground = "background1"
    var star = "等你来打分!😘"
    var title = "今日上新"
    @State var showCourseContent = false
    @State var isPresented = false
    

    var body: some View {
        ZStack {
            NavigationView{
                List(dishesdata){ item in
                    NavigationLink(destination: ContentView(name: item.name,canteen: item.canteen,img: item.img,info: item.info)){
                        HStack(){
                            Spacer(minLength: 15)
                            FoodView(dishname: item.name,canteen:item.canteen,img: item.img,background: cardBackground,score: item.score,star: star,price: String(item.price))
                            
                        }.frame(width: 350,height: 280)
                        
                    }.listRowBackground(Color.clear)
                }.navigationTitle(Text(title)
                    .font(.title)
                    .fontWeight(.bold))
            }
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}


struct singletitleView: View {
    var body: some View {
        VStack(spacing: 20.0){
            HStack {
                Text("航味")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            Image("Illustration 3").resizable().frame(width: 200.0, height: 150.0)
            Spacer()
            
        }.padding()
    }
}


