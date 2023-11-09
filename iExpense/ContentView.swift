//
//  ContentView.swift
//  iExpense
//
//  Created by Mich balkany on 11/8/23.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

// this carries all the data required for the main view
@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    
var body: some View {
    NavigationStack {
        List {
            ForEach(expenses.items) { item in
                Text(item.name)
            }
            .onDelete(perform: removeItem)
        }
        .navigationTitle("iExpense")
        .toolbar {
            Button("Add Expense", systemImage:"plus") {
                let expense = ExpenseItem(name: "Test", type: "personal", amount: 5)
                expenses.items.append(expense)
                }
            }
        }
    }
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
