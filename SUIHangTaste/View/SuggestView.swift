import SwiftUI

struct SuggestView: View {
    @Environment(\.managedObjectContext) var context
    @State var showFormView = false
    var thedishname = "宫保鸡丁"
    @FetchRequest(entity: SuggestModel.entity(), sortDescriptors: [NSSortDescriptor(keyPath:\SuggestModel.user,ascending: false)],animation: .default)
    var allsuggest: FetchedResults<SuggestModel>
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { allsuggest[$0] }.forEach(context.delete)
            
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    var body: some View {
        ZStack {
            NavigationView {
                List{
                    ForEach(allsuggest,id: \.date) { item in
                        NavigationLink(destination:SuggestDetails(date: item.date, text: "\(item.text)", user: "\(item.user)",canteenname:"\(item.canteen)") ){
                            VStack(alignment: .leading) {
                                Text("\(item.date,formatter: itemFormatter)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("\(item.text)")
                                    .lineSpacing(4)
                                    .font(.subheadline)
                                    .lineLimit(3)
                                HStack {
                                    Text("\(item.canteen)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                                    Text("\(item.user)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                                }
                                
                            }
                        }
                    }.onDelete(perform: deleteItems)
                }
                .navigationTitle(Text("建议"))
                .navigationBarItems(trailing:
                                        
                                        Button(action: { self.showFormView.toggle() })
                                    {
                    HStack {
                        Text("提出建议")
                        Image(systemName: "square.and.pencil")
                        
                    }.onTapGesture{
                        self.showFormView.toggle()
                    }
                }
                )
            }
            SuggestFormView(showFormView: $showFormView)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring(), value: showFormView)
                .offset(y: showFormView ? 100:UIScreen.main.bounds.height)
        }
    }
}
struct SuggestView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
struct SuggestFormView: View {
    @State var username = "szy"
    @State var text = ""
    @State var canteenname = "合一"
    @Binding var showFormView : Bool
    @State private var previewIndex = 0
    var previewOptions = canteens
    @Environment(\.managedObjectContext) private var viewcontext
    
    
    
    private func saveComment(){
        do{
            let suggest = SuggestModel(context: viewcontext)
            suggest.text = text
            suggest.user = "Taylor Swift"
            suggest.date = Date()
            suggest.canteen = canteens[previewIndex]
            try viewcontext.save()
            showFormView.toggle()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let datetime = formatter.string(from: Date())
        return datetime
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("NOTIFICATIONS")) {
                    Picker(selection: $previewIndex, label: Text("选择食堂")) {
                        ForEach(0 ..< previewOptions.count,id:\.self){
                            Text(self.previewOptions[$0])
                        }
                    }
                }
                Text("我的建议").font(.headline)
                HStack {
                    
                    //TextEditor(text: $text)
                    TextField("输入建议", text: $text)
                }
                Button(
                    action: { saveComment() },
                    label: { Text("提交") }
                )
            }.navigationBarTitle(Text("我的建议"))
        }
    }
}
