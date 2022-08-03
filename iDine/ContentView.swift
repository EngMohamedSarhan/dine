//
//  ContentView.swift
//  iDine
//
//  Created by Mohamed Sarhan on 01/08/2022.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List(menu) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { item in
                        NavigationLink( destination: ItemDetail(item: item)) {
                            MenuRow(item: item)
                        }
                    }
                }
            }.navigationTitle("Menu").listStyle(SidebarListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
            ContentView()
        }
    }
}
