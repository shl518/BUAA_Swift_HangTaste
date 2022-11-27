import SwiftUI

struct SuggestDetails: View {
    var date :Date = Date()
    var text = "loading"
    var user = "Taylor Swift"
    var canteenname = "合一"
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 20.0) {
            
            Image("suggest").resizable().frame(width: 360.0, height: 250.0)
            
            HStack{
                Text("建议者:\(user)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                Spacer()
            }.frame(width: 350)
            HStack {
                Text("建议日期:\(date,formatter: itemFormatter)")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }.frame(width: 350)
            HStack {
                Text("食堂:\(canteenname)").font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }.frame(width: 350)
            Text(text).lineLimit(nil).frame(minWidth: 0,  maxWidth:.infinity,alignment: .leading).padding()
            Spacer()
        }
    }
}

struct SuggestDetails_Previews: PreviewProvider {
    static var previews: some View {
        SuggestDetails()
    }
}
