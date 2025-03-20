//
//  ContentView.swift
//  Sourcecontrolbootcamp
//
//  Created by 湯川昇平 on 2025/03/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundStyle(.tint)
            
                .padding()
            
            Text("Swiftful thinking!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
