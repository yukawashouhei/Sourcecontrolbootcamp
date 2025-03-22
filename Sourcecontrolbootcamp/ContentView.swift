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
            
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundStyle(.yellow)
            
                .padding()
            
            Text("Swiftful thinking!")
                .padding()
            Button {
                // ボタンがタップされた時のアクション（ここでは何もしていません）
                print("Sub Now tapped!")
            } label: {
                Text("Sub Now")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top) // 少しスペースを空ける
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 500, height: 500)
                .padding(.top) // 少しスペースを空ける
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
