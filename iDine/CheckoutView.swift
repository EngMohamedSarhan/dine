//
//  CheckoutView.swift
//  iDine
//
//  Created by Mohamed Sarhan on 01/08/2022.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [0, 10, 15, 20, 25]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tip = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tip)) ?? "$0"
    }
    
    var body: some View {
        Form() {
            Section() {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }

            }
            Section(header: Text("Add a tip?")) {
                Picker("percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("$\($0)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total: \(totalPrice)").font(.headline)) {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }.navigationTitle("Payment").navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showingPaymentAlert) {
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK"), action: {
                    order.reset()
                    presentationMode.wrappedValue.dismiss()
                }))
            }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView().environmentObject(Order())
        }
    }
}
