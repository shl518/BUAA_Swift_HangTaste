import Foundation
import CoreData

public class CommentModel : NSManagedObject{
    @NSManaged public var id: UUID
    @NSManaged public var text: String
    @NSManaged public var date: Date
    @NSManaged public var user: String
    @NSManaged public var score: Int32
    @NSManaged public var dishname: String
}
