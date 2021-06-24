import SwiftUI
import CoreData
import MapKit

struct ContentView: View {
    @FetchRequest(entity: Annotations.entity(), sortDescriptors: []) var Notes: FetchedResults<Annotations>
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @State var landmarks: [Landmark]=[]
    
    var body: some View {
        NavigationView{
            MainView(landmarks: $landmarks)
                .onAppear(){
                    var data: [Landmark] = []
                    for obj in Notes {
                        data.append(Landmark(title: obj.title,
                                                       coordinate: .init(latitude: obj.x,
                                                                         longitude: obj.y)
                        ))
                    }
                    landmarks = data
                }
        }.edgesIgnoringSafeArea(.all)
        
    }
}

