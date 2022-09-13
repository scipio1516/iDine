//
//  OrderView.swift
//  iDine
//
//  Created by Leo Lai on 9/9/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        List {
            Section {
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price).00")
                    }
                }
            }
            Section {
                NavigationLink(destination: Text("Check Out! Does not work currently.")) {
                    Text("Place Order")
                }
            }
            .navigationTitle("Order")
            .listStyle(.insetGrouped)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        OrderView().environmentObject(Order())
        }
    }
}
