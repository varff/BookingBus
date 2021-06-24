import SwiftUI
import CoreData

class Annotations: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var x: Double
    @NSManaged public var y: Double
}
