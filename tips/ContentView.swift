//
//  ContentView.swift
//  tips
//
//  Created by Arthur on 24.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPrecentages = [0, 5, 10, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPrecentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amounPerPerson = grandTotal / peopleCount
        
        return amounPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Сколько чаевых вы хотите оставить?")) {
                    Picker("Tip perctntage", selection: $tipPercentage) {
                        ForEach(0..<tipPrecentages.count) {
                            Text("\(self.tipPrecentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
