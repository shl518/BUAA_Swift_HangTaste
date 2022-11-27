import Foundation
import SwiftUI

struct Dish : Identifiable{
    var id = UUID()
    var name:String
    var canteen:String
    var img:String
    var info:String
    var score:Int
    var price:Double
}
