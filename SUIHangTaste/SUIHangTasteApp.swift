import SwiftUI
import CoreData

@main
struct SUIHangTasteApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            TabBar().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
