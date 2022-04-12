//
//  ContentView.swift
//  WeSplit
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 03/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people",
                           selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip percentage",
                           selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section("Total amount") {
                    Text(grandTotal,
                    format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson,
                         format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .totalAmountStyle(tip: tipPercentage)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct TotalAmount: ViewModifier {
    var tip: Int
    
    func body(content: Content) -> some View {
        content
            .background(tip == 0 ? .red : .clear)
    }
}

extension View {
    func totalAmountStyle(tip: Int) -> some View {
        modifier(TotalAmount(tip: tip))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
