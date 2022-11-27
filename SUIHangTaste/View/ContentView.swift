import SwiftUI

struct ContentView: View {
    var name:String = "烤鸭卷"
    var canteen:String = "合一"
    var img :String = "烤鸭卷"
    var info : String = "介绍"
    @State var show = false
    @State var showcontent = false
    @State var showCommentList = false
    var body: some View {
        ZStack {
            bottomView(info:info,showcommentList: $showCommentList )
                .blur(radius: show ?20:0)
                .animation(.default, value: show)
            
            CardView()
                .offset(x:0,y:-190)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15:0))
                .rotation3DEffect(Angle(degrees: show ? 50:0),axis: (x:10.0,y:10.0,z:10.0))
                .blendMode(.darken)
                .animation(Animation.easeInOut(duration: 0.7), value: show)
            
            CardView()
                .offset(x:0,y:-160)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10: 0))
                .rotation3DEffect(Angle(degrees: show ? 40 : 0),axis: (x:10.0,y:10.0,z:10.0))
                .blendMode(/*@START_MENU_TOKEN@*/.darken/*@END_MENU_TOKEN@*/)
                .animation(Animation.easeInOut(duration: 0.5), value: show)
                
            
            CertificateView(name: name,canteen: canteen,img: img)
//                .offset(x:viewState.width,y:viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5:0))
                .rotation3DEffect(Angle(degrees: show ?30 : 0),axis: (x:10.0,y:10.0,z:10.0))
                .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0), value: show)
                .onTapGesture {
                    self.show.toggle()
                    
                }
            ///here
            UpdateList(filter: name,showCommentList: $showCommentList)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring(), value: showCommentList)
                .offset(y: showCommentList ? 70:UIScreen.main.bounds.height)
                
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            
        }
        .frame(width: 340.0, height: 280.0)
        .background(Color.orange)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct CertificateView: View {
    var name:String = "麻辣香锅"
    var canteen:String = "合一"
    var img:String = "烤鸭卷"
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack {
                        Text(name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(.top)
                        
                        Text(canteen)
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                    }
                    
                    
                }
                
            }
            Image(img).resizable()
                .frame(width: 350.0, height: 200.0)
        }
        .frame(width: 340.0, height: 280.0)
        .background(Color("CardColor")).cornerRadius(20)
        .shadow(radius: 20)
        .offset(y:-130)
    }
}

struct titleView: View {
    var body: some View {
        VStack(spacing: 20.0){
            HStack {
                Text("航味")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            Spacer()
            
        }.padding()
    }
}

struct CommentButton: View {
    @Binding var showCommenList : Bool
    var body: some View {
        ZStack {
            Button(action:{self.showCommenList.toggle()}) {
                HStack {
                    Spacer()
                    Image(systemName:"heart").foregroundColor(Color.orange)
                    Text("查看评论")
                }
                .frame(width:320,height: 44)
                .background(Color.white)
            }
            Spacer()
        }
    }
}

struct bottomView: View {
    var info:String = "宫保鸡丁（Kung Pao Chicken) ，是一道闻名中外的特色传统名菜 该菜式的起源与鲁菜中的酱爆鸡丁、贵州菜中的胡辣子鸡丁有关，后被清朝山东巡抚、四川总督丁宝桢改良发扬，形成了一道新菜式——宫保鸡丁，并流传，此道菜也被归纳为北京宫廷菜。之后宫保鸡丁也流传到国外。"
    @Binding var showcommentList :Bool
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .frame(width: 60.0, height: 6.0)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text(info)
                .lineLimit(10)
            CommentButton(showCommenList:$showcommentList)
            Spacer()
        }
        .frame(minWidth:0,maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y:360)
    }
}
