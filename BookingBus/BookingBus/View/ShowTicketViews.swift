/*import SwiftUI
import CoreData
import MapKit

struct ShowTicketViews: View {
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @State var selectedAnnotation: MKAnnotation?
    @State var fromAnnotation: MKAnnotation?
    @State var toAnnotation: MKAnnotation?
    
    @Binding var landmarks: [Landmark]
    @State var tickets: [Ticket]=Ticket.requestMockData()
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(tickets) {ticket in
                Text(ticket.title)
            }
    }
}
*/
