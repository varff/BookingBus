import SwiftUI

struct LoggedView: View {
    @EnvironmentObject var storage : Storage
    @Binding var logged: Bool
    var body: some View {
        
        NavigationView{
            List(){
                ForEach(storage.courses, id: \.id){ obj in
                    NavigationLink(destination: CourseFullView(obj: obj)){
                        VStack{
                            CourseView(obj: obj)
                        }
                    }
                    
                }
            }.navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action: {logged = false}, label: {
                Text("Log out")
            }))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
