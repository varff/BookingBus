//
//  AuthView.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 29.04.21.
//

import SwiftUI

struct AuthView: View {
    @State var login = ""
    @State var pass = ""
    @State var log_err = ""
    @State var pas_err = ""
    @Binding var logged : Bool
    @State var titl = "Log in please"
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text(LocalizedStringKey("Login")).font(.system(size: 25.0))
                    TextField("", text: $login)
                        .font(.system(size: 25.0))
                        .onReceive(login.publisher.collect()) {
                            self.login = String($0.prefix(10))
                        }
                }
                Text(LocalizedStringKey(log_err))
                HStack{
                    Text(LocalizedStringKey("Password")).font(.system(size: 25.0))
                    TextField("", text: $pass)
                        .font(.system(size: 25.0))
                        .onReceive(pass.publisher.collect()) {
                            self.pass = String($0.prefix(12))
                        }
                }
                Text(LocalizedStringKey(pas_err))
                HStack{
                    Spacer()
                    Button(action: {
                        let userDefaults = UserDefaults.standard
                        if self.login.count == 0 {
                            log_err = "Empty login"
                        }
                        else{
                            if self.pass.count == 0 {
                                pas_err = "Empty password"
                                log_err = ""
                            }
                            else{
                                let user = userDefaults.value(forKey: login)
                                    if user == nil {
                                        log_err = "Invalid login"
                                        pas_err = ""
                                    }
                                    else {
                                        if user as! String != pass {
                                            log_err = ""
                                            pas_err = "Not correct password"
                                        }
                                        else {
                                            
                                            logged = true
                                            titl = "Logged: "+login
                                            
                                        }
                                    }
                                }
                            }
                    }, label: {
                        Text(LocalizedStringKey("Log in")).fontWeight(.heavy)
                    })
                    Spacer()
                    Button(action: {
                        if logged {
                            logged.toggle()
                        }
                        titl = "Log in please"
                    }, label: {
                        Text(LocalizedStringKey("Log out")).fontWeight(.heavy)
                    })
                    Spacer()
                    
                }
                Spacer()
            }
            .padding(20).navigationTitle(LocalizedStringKey(titl))
            .navigationBarItems(trailing: NavigationLink(destination: RegView(logged: $logged)) {
                Text(LocalizedStringKey("Register")).fontWeight(.heavy)
            })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(logged: .constant(false)).environment(\.locale, .init(identifier: "ru"))
    }
}
