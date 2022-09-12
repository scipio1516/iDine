//
//  ItemRow.swift
//  iDine
//
//  Created by Leo Lai on 9/7/22.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .yellow, "G": .green, "N": .mint, "S": .purple, "V": .brown]
    
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2.0))
            VStack(alignment: .leading) {
                Text(item.name).font(.headline)
                HStack {
                    Text("$\(item.price).00").font(.caption)
                    Spacer()
                    ForEach(item.restrictions, id: \.self) {restriction in
                        Text(restriction)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(5)
                            .background(colors[restriction, default: .red])
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    
                }
            }
        }
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item:MenuItem.example)
    }
}
