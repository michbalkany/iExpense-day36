//
//  ContentView.swift
//  iExpense
//
//  Created by Mich balkany on 11/8/23.
//
import Observation
import SwiftUI

struct SecondView: View{
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View{
        Text("hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}


struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "mich")
        }
    }
}

#Preview {
    ContentView()
}




