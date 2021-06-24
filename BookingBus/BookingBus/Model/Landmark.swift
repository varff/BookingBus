import SwiftUI
import CoreData
import MapKit

class Landmark: NSObject, MKAnnotation {
    let title: String?
    var subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
        /*getWeatherString(coordinate: self.coordinate){ value in
            self.subtitle = value
            print("2-----" + value)
        }*/
    }
    
    /*func getWeatherString(coordinate: CLLocationCoordinate2D, completion: @escaping (String) -> ()){
        Api().getWeather(lat: coordinate.latitude, lon: coordinate.longitude){ value in
            DispatchQueue.main.async {
                let res = String(Int(round(value.main.temp))) + " C°, " + value.weather.first!.description
                completion(res)
                print("1-----" + res)
            }
        }
    }*/
    
    static func requestMockData()-> [Landmark]{
        return
            [
            Landmark(title: "Minsk",
                               coordinate: .init(latitude: 53.890632, longitude: 28.033768)),
            Landmark(title: "Grodno",
                               coordinate: .init(latitude: 53.40, longitude: 23.49)),
            Landmark(title: "Gomel",
                               coordinate: .init(latitude: 52.26, longitude: 31))
        ]
    }
}
