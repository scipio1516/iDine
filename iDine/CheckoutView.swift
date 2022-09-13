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
    var body: some View {
        let paymentTypes = ["Cash", "Credit", "Debit", "iDine Points"]
        
        VStack {
            Section {
                Form {
                    Picker("CHOOSE a payment type. No barter accepted.", selection: $paymentType) {
                        ForEach(paymentTypes, id: \.self) { payment in
                            Text(payment)
                        }
                    }.pickerStyle(MenuPickerStyle())
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
