//
//  CheckoutView.swift
//  iDine
//
//  Created by Leo Lai on 9/13/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tip = 10
    
    var body: some View {
        let paymentTypes = ["Cash", "Credit", "Debit", "iDine Points"]
        let tipAmounts = [10, 15, 20, 25, 0]
        
        Form {
            Section {
                Picker("CHOOSE a payment type. No barter accepted.", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) { payment in
                        Text(payment)
                    }
                }
            }
            Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
            if(addLoyaltyDetails) {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            
            Section(header: Text("Add a tip?"))
            {
                Picker("Percentage: ", selection: $tip) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total price: $420")) {
                Button("Check Out!") {
                    
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView().environmentObject(Order())
        }
    }
}
