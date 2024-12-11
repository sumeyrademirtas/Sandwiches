//
//  ContentView.swift
//  Sandwiches
//
//  Created by Sümeyra Demirtaş on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { // Aligns the button to the left
                    Button("Add", action: makeSandwich)
                }
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) { // Aligns Edit button to the right
                    EditButton()
                }
                #endif
            }
            
            Text("Select a sandwich")
                .font(.largeTitle)
        }
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3))
        }
    }
    
    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .preferredColorScheme(.dark)
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            HStack {
                Image(sandwich.imageName)
                    .resizable() // Ensure the image is resizable
                    .scaledToFill() // Maintain aspect ratio
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(sandwich.name)
                        .font(.headline)
                    Text("\(sandwich.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
