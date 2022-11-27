import Foundation
import SwiftUI
import CoreData
struct Comment : Identifiable{
    var id = UUID()
    var text:String
    var date:String
    var auser:String
}


