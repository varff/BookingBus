//
//  RegView.swift
//  l9_a
//
//  Created by Alex VARFALAMEYEU on 29.04.21.
//

import SwiftUI

struct RegView: View {
    @Binding var logged : Bool
    @State var login = ""
    @State var pass = ""
    @State var err_str_log = ""
    @State var err_str_pas = ""
    @State var rpass = ""
    let note = "You need 1 to 10 symbol login and 1 to 12 symbol pass"
    var body: some View {
        VStack{
            Text(LocalizedStringKey("Register")).fontWeight(.bold).font(.largeTitle)
            HStack{
                Text(LocalizedStringKey("Login")).font(.system(size: 25.0))
                TextField("", text: $login)
                    .font(.system(size: 25.0))
                    .onReceive(login.publisher.collect()) {
                            self.login = String($0.prefix(10))
                        }
            }
            Text(LocalizedStringKey(err_str_log)).foregroundColor(.red)
            HStack{
                Text(LocalizedStringKey("Password")).font(.system(size: 25.0))
                TextField("", text: $pass)
                    .font(.system(size: 25.0))
                    .onReceive(pass.publisher.collect()) {
                            self.pass = String($0.prefix(12))
                        }
            }
            HStack{
                Text(LocalizedStringKey("Repeat password")).font(.system(size: 25.0))
                TextField("", text: $rpass)
                    .font(.system(size: 25.0))
                    .onReceive(rpass.publisher.collect()) {
                        self.rpass = String($0.prefix(12))
                    }
            }
            Text(LocalizedStringKey(err_str_pas)).foregroundColor(.red)
            Text(LocalizedStringKey(note)).italic()
            Button(action: {
                let userDefaults = UserDefaults.standard
                
                if self.login.count == 0 {
                    err_str_log = "Empty login"
                }
                else{
                    if self.pass.count == 0 {
                        err_str_pas = "Empty password"
                        err_str_log = ""
                    }
                    else{
                        if rpass != pass
                        {
                            err_str_pas = "Passwords don't match"
                        }
                        else{
                            if userDefaults.value(forKey: login) != nil {
                                err_str_log = "Login already exists"
                                err_str_pas = ""
                            }
                            else {
                                userDefaults.setValue(pass, forKey: login)
                                userDefaults.synchronize()
                                login = ""
                                pass = ""
                                rpass = ""
                                err_str_log = ""
                                err_str_pas = ""
                                logged = true
                            }
                        }
                    }
                }
                
            }, label: {
                Text("Register").font(.title2)
            })
            Spacer()
        }.padding()
    }
}
