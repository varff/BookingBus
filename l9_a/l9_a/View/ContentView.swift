//
//  ContentView.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 29.04.21.
//

import SwiftUI

struct ContentView: View {
    @State var isLogged = false
    var body: some View {
        if isLogged{
            LoggedView(logged: $isLogged)
                .environmentObject(Storage())
                .padding().edgesIgnoringSafeArea(.all)
                
        }
        else
        {
            AuthView(logged: $isLogged)
                .padding().edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.locale, .init(identifier: "ru"))
    }
}
