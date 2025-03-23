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

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) { // 要素間の間隔を設定
            // MARK: - ハートアイコン
            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                .font(.largeTitle)
                .foregroundColor(isHeartFilled ? .red : .gray)
                .onTapGesture { // タップで状態を切り替え
                    withAnimation {
                        isHeartFilled.toggle()
                    }
                }

            // MARK: - スターアイコン
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .scaleEffect(1.0 + Double(tapCount) * 0.1) // タップ回数に応じて少し拡大

            // MARK: - テキスト
            Text(tapCount > 5 ? "たくさんタップありがとう！" : "Swiftful thinking!")
                .font(.title2)
                .padding()

            // MARK: - ボタン
            Button {
                tapCount += 1
                // タップ回数に応じてボタンの色を変更
                withAnimation {
                    if tapCount % 2 == 0 {
                        buttonColor = .green
                    } else {
                        buttonColor = .blue
                    }
                }
                print("Sub Now tapped! Count: \(tapCount)")
            } label: {
                Text("Sub Now (\(tapCount))") // ボタンにタップ回数を表示
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(buttonColor)
                    .cornerRadius(10)
            }
            .padding(.top, 10) // 少しスペースを空ける

            // MARK: - 黒いRectangle (練習用として残す)
            Rectangle()
                .fill(Color.black)
                .frame(width: 100, height: 100) // サイズを小さく
                .padding(.top, 30) // 少しスペースを空ける
                .opacity(Double(tapCount) > 10 ? 0.5 : 1.0) // タップ回数で透明度を変更
        }
        .padding()
        .animation(.easeInOut(duration: 0.3), value: isHeartFilled) // ハートの状態変化にアニメーション
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: tapCount) // タップ回数変化にスプリングアニメーション
    }
}

#Preview {
    ContentView()
}
