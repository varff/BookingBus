//
//  CourseFullView.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 14.05.21.
//

import SwiftUI

struct CourseFullView: View {
    @State var showTeacherInfo = false
    var obj : Course
    var body: some View {
        ZStack{
            VStack{
                Image(obj.image).resizable()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: .infinity, minHeight: 320, maxHeight: 320, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(obj.name)
                Text(obj.description)
                    .lineLimit(nil)
                HStack{
                    Spacer()
                    VStack{
                        Text(obj.teacher)
                            .italic().onTapGesture {
                                showTeacherInfo.toggle()
                            }
                        if showTeacherInfo{
                            Text(obj.teachInfo).italic()
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}
