//
//  AddView.swift
//  iExpense
//
//  Created by Mich balkany on 11/9/23.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "New expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    static let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save"){
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddView()
        .modelContainer(for: ExpenseItem.self)
}
