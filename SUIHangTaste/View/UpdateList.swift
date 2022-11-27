import SwiftUI
import CoreData

struct UpdateList: View {
    @Environment(\.managedObjectContext) var context
    
    var thedishname = "宫保鸡丁"
    @Binding var showCommentList:Bool
    @State var showModelView = false
    @State var showFromView = false
    
    @FetchRequest var allcomments: FetchedResults<CommentModel>
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { allcomments[$0] }.forEach(context.delete)
            
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
                    ForEach(allcomments,id: \.date) { item in
                        NavigationLink(destination:commentDetails(date: item.date, text: "\(item.text)", user: "\(item.user)",score: Int(item.score)) ){
                            VStack(alignment: .leading) {
                                Text("\(item.date,formatter: itemFormatter)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("\(item.text)")
                                    .lineSpacing(4)
                                    .font(.subheadline)
                                    .lineLimit(3)
                                Text("\(item.user)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                                
                            }
                        }
                    }.onDelete(perform: deleteItems)
                }
                .navigationTitle(Text("评论"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {self.showCommentList.toggle()}) {
                            Label("Add Item", systemImage: "return")
                        }
                    }
                }
                .navigationBarItems(trailing:
                                        
                                        Button(action: { self.showModelView.toggle() })
                                    {
                    HStack {
                        Text("我要评论")
                        Image(systemName: "square.and.pencil")
                        
                    }.onTapGesture{
                        self.showFromView.toggle()
                    }
                }
                ).sheet(isPresented: $showModelView)
                {
                    ContentView().onTapGesture{
                        self.showModelView.toggle()
                    }
                }
            }
            FormView(dishname: thedishname,showFormView: $showFromView)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring(), value: showFromView)
                .offset(y: showFromView ? 40:UIScreen.main.bounds.height)
            //                .onTapGesture {
            //                    self.showFromView.toggle()
            //                }
            
        }
    }
    init(filter: String,showCommentList:Binding<Bool>) {
        self._allcomments = FetchRequest(entity: CommentModel.entity(), sortDescriptors: [NSSortDescriptor(keyPath:\CommentModel.user,ascending: false)],predicate: NSPredicate(format: "dishname == %@",filter),animation: .default)
        self._showCommentList = showCommentList
        self.thedishname = filter
    }
    
}

struct UpdateList_Previews: PreviewProvider {
    
    @State static var testshow = true
    @State static var filter = "宫保鸡丁"
    static var previews: some View {
        UpdateList(filter: filter,showCommentList: $testshow).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct FormView: View {
    @State var username = ""
    @State var text = ""
    @State var dishname = "宫保鸡丁"
    @State private var maxPriceLevel:Int32 = 5
    @Binding var showFormView :Bool
    @Environment(\.managedObjectContext) private var viewcontext
    
    
    
    private func saveComment(){
        do{
            let comment = CommentModel(context: viewcontext)
            print("save \(text) \(maxPriceLevel) \(dishname)")
            comment.text = text
            comment.user = "Taylor Swift"
            comment.date = Date()
            comment.score = maxPriceLevel
            comment.dishname = dishname
            try viewcontext.save()
            showFormView = false
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
                Section(
                    header: Text("菜品评分1～5")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                ){
                    
                    Stepper(
                        onIncrement: {
                            self.maxPriceLevel += 1
                            
                            if(self.maxPriceLevel > 5){
                                self.maxPriceLevel = 5
                            }
                        },
                        onDecrement: {
                            self.maxPriceLevel -= 1
                            
                            if(self.maxPriceLevel < 1){
                                self.maxPriceLevel = 1
                            }
                        },
                        label: {
                            Text(" \(String(repeating: "🌟",count: Int(maxPriceLevel)))")
                        })
                }
                Text("菜品评价").font(.headline)
                HStack {
                    
                    //TextEditor(text: $text)
                    TextField("输入评价", text: $text)
                }
                Button(
                    action: { saveComment() },
                    label: { Text("提交") }
                )
            }.navigationBarTitle(Text("我的评论"))
        }
    }
}
