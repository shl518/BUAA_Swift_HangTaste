import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(selection: .constant(1)){
            Home(dishesdata: newdishes,cardBackground: "background1",star: "等你来打分!😘",title: "今日上新").tabItem {
                VStack {
                    Image(systemName: "message.and.waveform")
                    Text("航味上新")
                }
            }
            .tag(1)
            Home(dishesdata: gooddishes,cardBackground: "background2",star: "🌟",title: "航味榜中榜").tabItem {
                VStack {
                    Image(systemName: "menucard")
                    Text("航味榜中榜")
                }
            }
            .tag(2)
            SuggestView().tabItem {
                VStack {
                    Image(systemName: "person.wave.2")
                    Text("我的建议")
                }
            }
            .tag(3)
            AutoSelect().tabItem {
                VStack {
                    Image(systemName: "cart")
                    Text("生成航味")
                }
            }
            .tag(4)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
