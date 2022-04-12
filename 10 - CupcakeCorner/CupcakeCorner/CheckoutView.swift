//
//  CheckoutVIew.swift
//  CupcakeCorner
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 16/02/2022.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showConfirmation = false
    @State private var errorMessage = ""
    @State private var showErrorMessage = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
						.accessibilityElement()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.object.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showConfirmation) {
            Button("OK"){}
        } message: {
            Text(confirmationMessage)
        }
        .alert("An error occured", isPresented: $showErrorMessage) {
            Button("OK"){}
        } message: {
            Text(errorMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.object.quantity)x \(OrderStruct.types[decodedOrder.object.type].lowercased()) cupcakes is on its ways"
            showConfirmation = true
        } catch {
            errorMessage = "Something went wrong. Please try again later"
            showErrorMessage = true
        }
        
    }
}

struct CheckoutVIew_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
