//
//  ItemFull.swift
//  iDine
//
//  Created by Leo Lai on 9/8/22.
//

import SwiftUI

struct ItemFull: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            ZStack(alignment:.bottomTrailing) {
            Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .font(.caption)
                    .padding(2)
                    .background(.black)
                    .foregroundColor(.white)
                    
            }
            Text(item.description)
                .padding()
            Button("Order It!") {
                order.add(item: item)
            }.padding(7)
            .background(.cyan)
            .foregroundColor(.white)
            .border(.black, width:2)
            .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemFull_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemFull(item:MenuItem.example).environmentObject(Order())
        }
    }
}
