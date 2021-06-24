import SwiftUI
import CoreData

struct AddView: View {
    @Environment(\.managedObjectContext) var moc: NSManagedObjectContext
    @FetchRequest(entity: Routes.entity(), sortDescriptors: []) var routes: FetchedResults<Routes>
    @FetchRequest(entity: Annotations.entity(), sortDescriptors: []) var Notes: FetchedResults<Annotations>
    @State var fromPlace: String = ""
    @State var toPlace: String=""
    @State var title: String=""
    @State var placeNum: String = "0"
    @State var price: String = "0"
    @State var x: String = "0.0"
    @State var y: String = "0.0"
    
    var body: some View {
        Form {
            Section(header: Text("Add landmarks")){
                TextField("enter title", text: $title)
                TextField("enter x", text: $x)
                TextField("enter y", text: $y)
                Button(action: {
                    let obj = Annotations(context: self.moc)
                    obj.id = UUID()
                    obj.x = Double(x) ?? 0.0
                    obj.y = Double(y) ?? 0.0
                    obj.title = title
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    Text("Add")
                }
            }
            Section(header: Text("Add routes")){
                TextField("enter fromPlace", text: $fromPlace)
                TextField("enter toPlace", text: $toPlace)
                TextField("enter placeNum", text: $placeNum)
                TextField("enter price", text: $price)
                Button(action: {
                    let obj = Routes(context: self.moc)
                    obj.id = UUID()
                    obj.fromId = Notes.first(where: { $0.title == fromPlace})!.id
                    obj.toId = Notes.first(where: {$0.title == toPlace})!.id
                    obj.fromPlace = fromPlace
                    obj.toPlace = toPlace
                    obj.placeNum = Int(placeNum) ?? 0
                    obj.price = Int(price) ?? 0
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    Text("Add")
                }
            }
        }
    }
}
