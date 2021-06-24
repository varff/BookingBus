import SwiftUI
import MapKit

struct TicketView: View {
    @FetchRequest(entity: Routes.entity(), sortDescriptors: []) var routes: FetchedResults<Routes>
    @FetchRequest(entity: Annotations.entity(), sortDescriptors: []) var Notes: FetchedResults<Routes>
    @Binding var fromAnnotation: MKAnnotation?
    @Binding var toAnnotation: MKAnnotation?
    @State var isSelection=false
    @State private var selectionRoute = 0
    var body: some View {
            Section(header: Text("Choosing a route")) {
                    ForEach(routes) {route in
                        if route.fromPlace == fromAnnotation?.title && route.toPlace == toAnnotation?.title
                        {
                        Text("Place number: \(route.placeNum) "+"Price: \(route.price)")
                        }
                    }
                
        }
    }
    }

