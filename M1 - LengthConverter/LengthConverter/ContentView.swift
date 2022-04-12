//
//  ContentView.swift
//  LengthConverter
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentInputType = "Kilometers"
    @State private var currentOutputType = "Miles"
    @State private var inputValue = 0.0
    
    let lengthTypes = ["Kilometers", "Miles"]
    
    var convertionResult: Double {
        
        // Input
        let inputLength: Measurement<UnitLength>
        
        switch currentInputType {
        case "Kilometers":
            inputLength = Measurement(value: inputValue,
                                 unit: UnitLength.kilometers)
        case "Miles":
            inputLength = Measurement(value: inputValue,
                                 unit: UnitLength.miles)
            
        default:
            inputLength = Measurement(value: inputValue,
                                 unit: UnitLength.kilometers)
        }
        
        // Output
        let outputLength: Measurement<UnitLength>
        switch currentOutputType {
        case "Kilometers":
            outputLength = inputLength.converted(to: .kilometers)
            
        case "Miles":
            outputLength = inputLength.converted(to: .miles)
            
        default:
            outputLength = inputLength.converted(to: .miles)
        }
        
        return outputLength.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section("Input") {
                    TextField("Value",
                              value: $inputValue,
                              format: .number)
                    
                    Picker("Convert from",
                           selection: $currentInputType) {
                        ForEach(lengthTypes, id: \.self) {
                            Text($0)
                        }
                    }
                           .pickerStyle(.segmented)
                }
                
                Section("Output") {
                    Picker("Convert to",
                           selection: $currentOutputType) {
                        ForEach(lengthTypes, id: \.self) {
                            Text($0)
                        }
                    }
                           .pickerStyle(.segmented)
                    
                    Text(convertionResult,
                         format: .number)
                }
            }
            .navigationTitle("LengthConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
