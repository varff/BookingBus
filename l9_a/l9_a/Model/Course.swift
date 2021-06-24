//
//  Course.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 14.05.21.
//

import SwiftUI

class Course{
    var id: Int
    var name: String
    var description: String
    var image: String
    var teacher: String
    var teachInfo: String
    
    init(id: Int, name: String, description: String,image: String,teacher:String, teachInfo:String){
        self.id = id
        self.description = description
        self.image = image
        self.teacher = teacher
        self.name = name
        self.teachInfo = teachInfo
    }
}
