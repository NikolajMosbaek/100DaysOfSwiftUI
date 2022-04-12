//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 15/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.object.type) {
                        ForEach(OrderStruct.types.indices) {
                            Text(OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.object.quantity)", value: $order.object.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.object.specialRequestEnabled.animation())
                    
                    if order.object.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.object.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.object.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
