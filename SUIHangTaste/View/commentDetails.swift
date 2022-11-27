import SwiftUI

struct commentDetails: View {
    var date :Date = Date()
    var text = "loading"
    var user = "Taylor Swift"
    var score = 5
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 20.0) {
            Image("comment").resizable().frame(width: 340.0, height: 250.0)
            
            HStack{
                Text("评论者:\(user)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                Spacer()
            }.frame(width: 350)
            HStack {
                Text("评论日期:\(date,formatter: itemFormatter)")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }.frame(width: 350)
            HStack {
                Text("分数:\(String(repeating: "🌟",count: score))").fontWeight(.bold)
                Spacer()
            }.frame(width: 350)
            Text(text).lineLimit(nil).frame(minWidth: 0,  maxWidth:.infinity,alignment: .leading).padding()
            Spacer()
        }
    }
}

struct commentDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            commentDetails()
        }
    }
}
