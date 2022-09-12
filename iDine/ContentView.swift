//
//  ContentView.swift
//  iDine
//
//  Created by Leo Lai on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) {section in
                    Section(header:Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemFull(item:item)) {
                            ItemRow(item:item)
                            }
                        }
                    }
                }
            }.navigationTitle("Menu")
                .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
