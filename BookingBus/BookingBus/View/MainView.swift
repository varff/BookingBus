import SwiftUI
import CoreData
import MapKit

struct MainView: View {
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @State var isActive: Bool = false
    @State var selectedAnnotation: MKAnnotation?
    @State var fromAnnotation: MKAnnotation?
    @State var toAnnotation: MKAnnotation?
    
    @Binding var landmarks: [Landmark]
    @State var landm: [Landmark]=Landmark.requestMockData()
    
    var body: some View {
        ZStack( alignment: .bottom){
            MapView(landmarks: $landm, isClicked: $isActive, selectedAnnotation: $selectedAnnotation).edgesIgnoringSafeArea(.all)
            VStack(){
                HStack{
                    Button("From") {
                        fromAnnotation=selectedAnnotation
                    }
                    Button("To") {
                        toAnnotation=selectedAnnotation
                    }
                }
                .padding(.bottom, 15)
                HStack{
                    Text("From: ")
                    Text(((fromAnnotation?.title) ?? "from")!)
                }
                HStack{
                    Text("To: ")
                    Text(((toAnnotation?.title) ?? "to")!)
                }
                if fromAnnotation != nil && toAnnotation != nil
                {
                NavigationLink(
                    destination: TicketView(fromAnnotation: $fromAnnotation, toAnnotation: $toAnnotation)){
                    //destination: AddView()){
                Text("Select route")
                }
                }
            }
            .frame(minWidth : 400, minHeight : 150).background(Color.pink)
            
        }.frame(maxWidth : UIScreen.main.bounds.width, maxHeight : UIScreen.main.bounds.height, alignment: .bottom)
    }
}

