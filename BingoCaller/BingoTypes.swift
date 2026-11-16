//
//  BingoTypes .swift
//  BingoCaller
//
//  Created by John Gallaugher on 11/14/26.
//

import SwiftUI

enum Letter: String, CaseIterable {
    case b = "B"
    case i = "I"
    case n = "N"
    case g = "G"
    case o = "O"
    
    var color: Color {
        switch self {
        case .b: return .blue
        case .i: return .red
        case .n: return .purple
        case .g: return .green
        case .o: return .orange
        }
    }
    
    var firstNumber: Int {
        switch self {
        case .b: return 1
        case .i: return 16
        case .n: return 31
        case .g: return 46
        case .o: return 61
        }
    }
}

struct Ball: Identifiable {
    let id = UUID().uuidString
    var letter: Letter
    var number: Int
}
