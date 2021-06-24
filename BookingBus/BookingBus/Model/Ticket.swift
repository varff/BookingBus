import SwiftUI
import CoreData
import MapKit

class Ticket{
    
    let title: String?
    var price: Int
    
    init(title: String?, price: Int) {
        self.title = title
        self.price = price
        }
    
    static func requestMockData()-> [Ticket]{
        return
            [
                Ticket(title: "Минск-Гомель",price : 30),
                Ticket(title: "Минск-Гродно", price: 35),
                Ticket(title: "Гомель-Минск",price: 40)
        ]
    }
}
