//
//  ContentView.swift
//  Sourcecontrolbootcamp
//
//  Created by 湯川昇平 on 2025/03/20.
//

//
//  ContentView.swift
//  Sourcecontrolbootcamp
//
//  Created by 湯川昇平 on 2025/03/20.
//

import SwiftUI

struct ContentView: View {
    // MARK: - State Variables
    @State private var tapCount: Int = 0
    @State private var buttonColor: Color = .blue
    @State private var isHeartFilled: Bool = true
    @State private var cornerRadius: CGFloat = 0 // 角の丸みを保持する変数
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - ハートアイコン
            Image(systemName: isHeartFilled ? "cloud.sun.rain.fill" : "cloud.sun.rain")
                .font(.largeTitle)
                .onTapGesture {
                    withAnimation {
                        isHeartFilled.toggle()
                    }
                }
            Text("mike here")
            // MARK: - スターアイコン
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .scaleEffect(1.0 + Double(tapCount) * 0.1)
            
            // MARK: - テキスト
            Text(tapCount > 5 ? "たくさんタップありがとう！" : "Swiftful thinking!")
                .font(.title2)
                .padding()
            
            // MARK: - ボタン
            Button {
                tapCount += 1
                withAnimation {
                    if tapCount % 2 == 0 {
                        buttonColor = .green
                    } else {
                        buttonColor = .blue
                    }
                }
                print("Sub Now tapped! Count: \(tapCount)")
            } label: {
                Text("Sub Now (\(tapCount))")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(buttonColor)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
            
            // MARK: - スライダー
            Slider(value: $cornerRadius, in: 0...50, label: { // スライダーの範囲を0から50に設定
                Text("Corner Radius")
            })
            .padding()
            
            // MARK: - 角丸Rectangle
            RoundedRectangle(cornerRadius: cornerRadius) // スライダーの値で角丸を調整
                .fill(Color.black)
                .frame(width: 100, height: 100)
                .padding(.top, 30)
                .opacity(Double(tapCount) > 10 ? 0.5 : 1.0)
                .animation(.easeInOut(duration: 0.3), value: cornerRadius) // アニメーションを追加
        }
        .padding()
        .animation(.easeInOut(duration: 0.3), value: isHeartFilled)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: tapCount)
    }
}

#Preview {
    ContentView()
}
