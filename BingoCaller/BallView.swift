//
//  BallView.swift
//  BingoCaller
//
//  Created by John Gallaugher on 11/14/26.
//

import SwiftUI

struct BallView: View {
    let ball: Ball
    var body: some View {
        ZStack {
            Circle()
                .fill(ball.letter.color)
            VStack(spacing: 0) {
                Text("\(ball.letter.rawValue)")
                    .font(.title3)
                Text("\(ball.number)")
                    .font(.title)
                    .fontWeight(.black)
            }
            .foregroundStyle(.white)
        }
        .frame(width: 70, height: 70)
    }
}

#Preview {
    BallView(ball: Ball(letter: .g, number: 52))
}
