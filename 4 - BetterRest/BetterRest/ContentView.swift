//
//  ContentView.swift
//  BetterRest
//
//  Created by Nikolaj Søgaard Mosbæk Nielsen on 25/11/2021.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var bedTime: String {
        self.calculateBedTime()
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("When do you want to wake up?") {
                    
                    DatePicker("Please enter a time",
                               selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours",
                            value: $sleepAmount,
                            in: 4...12,
                            step: 0.25)
                }
                Section("Daily coffee intake") {
                    Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                        ForEach(getPossibleCoffeeAmounts(), id: \.self) {
                            Text($0 == 1 ? "1 cup" : "\($0) cups")
                        }
                    }
                }
                
                Section("You should go to bed at") {
                    Text("\(self.bedTime)")
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func getPossibleCoffeeAmounts() -> [Int] {
        var possibleCoffeeAmounts: [Int] = []
        
        for i in 1...20 {
            possibleCoffeeAmounts.append(i)
        }
        
        return possibleCoffeeAmounts
    }
    
    func calculateBedTime() -> String {
        var alertMessage = ""
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertMessage = "\(sleepTime.formatted(date: .omitted, time: .shortened))"
            
        } catch {
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        print(alertMessage)
        return alertMessage
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
