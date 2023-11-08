//
//  ContentView.swift
//  iExpense
//
//  Created by Mich balkany on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    // we only add the ForEach because adding the delete modifier only works with a ForEach as opposed to placing the rows in the list
                    ForEach(numbers, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("add new number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar{
                EditButton()
            }
        }
    }
    
    func removeRows(at offSets: IndexSet) {
        numbers.remove(atOffsets: offSets)
    }
    
}

#Preview {
    ContentView()
}
