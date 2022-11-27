import SwiftUI

struct Home: View {
    var dishesdata = newdishes
    var cardBackground = "background1"
    var star = "等你来打分!😘"
    var title = "今日上新"
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        
        ZStack{
            HomeList(dishesdata: dishesdata,cardBackground: cardBackground,star: star,title: title)
                .blur(radius: show ? 20:0)
                .scaleEffect(0.95)
                .animation(.default, value: show)
            Info()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring(), value: showProfile)
                .offset(y: showProfile ? 40:UIScreen.main.bounds.height)
            MenuRight(show: $showProfile)
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct Menurow: View {
    var image = "message.and.waveform"
    var text = "航味上新"
    var body: some View {
        HStack {
            Image(systemName: image).foregroundColor(Color.orange)
                .frame(width:32,height: 32)
            Text(text)
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var icon :String
    
}
let menuData = [
    Menu(title: "航味上新", icon: "message.and.waveform"),
    Menu(title: "航味菜单", icon: "menucard"),
    Menu(title: "航味榜", icon: "heart"),
    Menu(title: "我的建议", icon: "person.wave.2"),
    Menu(title: "生成航味", icon: "cart"),
]


struct MenuView: View {
    let menu = menuData
    @Binding var show : Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            ForEach(menu){ item in
                Menurow(image: item.icon , text: item.title)
            }
            
            
            Spacer()
        }
        .padding(.top,20)
        .padding(30)
        .frame(minWidth:0,maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing,60)
        .shadow(radius: 20).rotation3DEffect(Angle(degrees: show ? 0:60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.default, value: show)
        .offset(x:show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon :String
    var body: some View {
        HStack {
            Image(systemName: icon).foregroundColor(Color.orange)
        }
        .frame(width:44,height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        ZStack {
            Button(action:{self.show.toggle()}) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash").foregroundColor(Color.orange)
                }
                .padding(.trailing,10)
                .frame(width:60,height: 40)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                Spacer()
                
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct MenuRight: View {
    @Binding var show : Bool
    var body: some View {
        ZStack {
            HStack {
                Button(action:{self.show.toggle()}) {
                    CircleButton(icon: "bell")
                }
                Button(action:{self.show.toggle()}) {
                    CircleButton(icon: "person.crop.circle")
                }
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
    }
}
