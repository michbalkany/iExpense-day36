//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Mich balkany on 11/8/23.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
