//
//  Part4View.swift
//  CupcakeCorner
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 15/02/2022.
//

import SwiftUI

struct Part4View: View {
    @State private var username = ""
    @State private var email = ""
    

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct Part4View_Previews: PreviewProvider {
    static var previews: some View {
        Part4View()
    }
}
