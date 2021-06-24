//
//  PlistController.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 14.05.21.
//

import UIKit
import SwiftUI

class PlistController{
    func GetAllCourses() -> [Course] {
        var data: [Course] = []
        if let path = Bundle.main.url(forResource: "Courses", withExtension: "plist"){
            do{
                let plistData  = try Data(contentsOf: path)
                if let arr = try PropertyListSerialization.propertyList(from: plistData, options:[], format: nil) as? [String:AnyObject]{
                    for(key, value) in arr{
                        data.append(Course(id: Int(key)!, name: value["name"] as! String, description: value["description"] as! String, image: value["image"] as! String, teacher: value["teacher"] as! String, teachInfo: value["teachInfo"]as! String))
                    }
                }
            }catch{
                print(error)
            }
        }
        return data
    }
}
