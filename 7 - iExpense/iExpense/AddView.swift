//
//  AddView.swift
//  iExpense
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 13/01/2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currencyCode: String = "DKK"
    
    let types = ["Business", "Personal"]
    let currencyCodes = ["DKK", "USD", "EUR", "ARS", "AED", "NOK", "SEK"]
        
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $currencyCode) {
                    ForEach(currencyCodes.sorted { $0 < $1 }, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name,
                                           type: type,
                                           amount: amount,
                                           currencyCode: currencyCode)
                    
                    if type == "Personal" {
                        expenses.personalItems.append(item)
                    } else {
                        expenses.businessItems.append(item)
                    }
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
