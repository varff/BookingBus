//
//  LocalStorage.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 14.05.21.
//

import SwiftUI

class Storage: ObservableObject{
    @Published var courses : [Course] = PlistController().GetAllCourses()
}
