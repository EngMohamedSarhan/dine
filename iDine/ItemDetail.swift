//
//  ItemDetail.swift
//  iDine
//
//  Created by Mohamed Sarhan on 01/08/2022.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let item: MenuItem
    
    var body: some View {
        VStack() {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage).resizable().scaledToFit()
                Text("Photo: $\(item.photoCredit)").padding(4)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .cornerRadius(5)
                    .offset(x: -5, y: -5)
                
                
            }
            Text(item.description).padding()
            Button("Order") {
                order.add(item: item)
            }.font(.headline)
            Spacer()
        }.navigationTitle(item.name).navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
