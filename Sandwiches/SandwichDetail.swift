//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by Sümeyra Demirtaş on 12/11/24.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            
        Image(sandwich.imageName)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .onTapGesture {
                withAnimation
                {
                    zoomed.toggle()
                }
            }
            Spacer(minLength: 0)
            
            if sandwich.isSpicy && !zoomed {
                
                
                HStack {
                    Spacer()
                    Label("Spicy", systemImage: "flame.fill")
                    Spacer()
                }
                .padding(.all)
                .font(Font.headline.smallCaps())
                .background(Color.red)
                .foregroundColor(Color.yellow)
                }
            }
            
            .navigationTitle(sandwich.name)
            .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    NavigationView {
        SandwichDetail(sandwich: testData[8])
    }
}
