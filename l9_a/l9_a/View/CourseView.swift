//
//  CourseView.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 14.05.21.
//

import SwiftUI

struct CourseView: View {
    var obj : Course
    
    func devCheck()->CGFloat{
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 1080
        }
        return 320
    }
    var body: some View {
        
        ZStack{
            VStack{
                
                Image(obj.image)
                    .resizable()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: .infinity, minHeight: 320, maxHeight: devCheck(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(obj.name)
            }
        }
    }
}
