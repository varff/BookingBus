import SwiftUI
import CoreData

class Routes: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var fromPlace: String
    @NSManaged public var toPlace: String
    @NSManaged public var fromId: UUID
    @NSManaged public var placeNum: Int
    @NSManaged public var toId: UUID
    @NSManaged public var price: Int
    
}
