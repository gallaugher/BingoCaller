//
//  ContentView.swift
//  BingoCaller
//
//  Created by John Gallaugher on 11/14/26.
//

import SwiftUI

struct ContentView: View {
    @State private var balls: [Ball] = []
    @State private var calledBalls: [Ball] = []
    @State private var message = "Ready?"
    @State private var messageColor: Color = .black
    
    var body: some View {
        VStack {
            Text("Bingo Caller")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Text(message)
                .font(Font.system(size: 72))
                .fontWeight(.black)
                .foregroundStyle(messageColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            HStack (spacing: 30) {
                ForEach(Letter.allCases, id: \.self) { letter in
                    VStack {
                        Text("\(letter.rawValue)")
                            .font(.largeTitle)
                            .fontWeight(.black)
                        Text("\(numberCalled(for: letter))")
                            .font(.title3)
                    }
                    .foregroundStyle(letter.color)
                }
            }
            
            HStack {
                Button("Call Next Ball") {
                    withAnimation {
                        callBall()
                    }
                }
                .disabled(balls.isEmpty)
                
                Button("New Game") {
                    newGame()
                    
                }
            }
            .font(.title3)
            .buttonStyle(.glassProminent)
            
            Text("Called: \(calledBalls.count)   Left: \(balls.count)")
                .font(.title3)
            
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(calledBalls) { ball in
                        BallView(ball: ball)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            newGame()
            print("There are \(balls.count) balls")
        }
    }
    
    func newGame() {
        balls = []
        calledBalls = []
        message = "Ready?"
        messageColor = .black
        
        for letter in Letter.allCases {
            for number in letter.firstNumber...letter.firstNumber+14 {
                balls.append(Ball(letter: letter, number: number))
            }
        }
        balls.shuffle()
    }
    
    func callBall() {
        let calledBall = balls.removeFirst()
        calledBalls.append(calledBall)
        message = "\(calledBall.letter.rawValue) \(calledBall.number)"
        messageColor = calledBall.letter.color
    }
    
    func numberCalled(for letter: Letter) -> Int {
        var letterCount = 0
        for ball in calledBalls {
            if ball.letter == letter {
                letterCount += 1
            }
        }
        return letterCount
    }
}

#Preview {
    ContentView()
}
