//
//  MenuRow.swift
//  iDine
//
//  Created by Mohamed Sarhan on 01/08/2022.
//

import SwiftUI

struct MenuRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: MenuItem
    
    var body: some View {
        HStack() {
            Image(item.thumbnailImage).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name).font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) {
                restriction in
                Text(restriction).font(.caption).fontWeight(.black).padding(5).background(colors[restriction, default: .black] ).clipShape(Circle())
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(item: MenuItem.example)
    }
}
