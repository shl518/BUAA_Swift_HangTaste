import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for _ in 0..<5 {
            let newItem = CommentModel(context: viewContext)
            newItem.date = Date()
            newItem.user = "Tayler"
            newItem.text = "很好吃"
            newItem.score = 5
            newItem.dishname = "香辣焖锅"
        }
        for _ in 0..<5 {
            let newItem = CommentModel(context: viewContext)
            newItem.date = Date()
            newItem.user = "Tayler"
            newItem.text = "不好吃"
            newItem.score = 1
            newItem.dishname = "宫保鸡丁"
        }
        for _ in 0..<5 {
            let newItem = SuggestModel(context: viewContext)
            newItem.date = Date()
            newItem.user = "Tayler"
            newItem.text = "希望排骨少放一点辣椒"
            newItem.canteen = "合一"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CommentModel")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
