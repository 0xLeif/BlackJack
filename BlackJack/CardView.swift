//
//  CardView.swift
//  BlackJack
//
//  Created by Zach Eriksen on 10/23/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

enum CardSuit: String, CaseIterable {
    case heart
    case diamond
    case spade
    case club
    
    var sf: Image {
        Image(systemName: "suit.\(rawValue)")
    }
}

enum CardValue {
    case ace
    case number(value: Int)
    case jack
    case queen
    case king
    
    var cardValue: String {
        switch self {
        case .ace:
            return "\(1)"
        case .number(let value):
            return "\(value)"
        case .jack:
             return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        }
    }
}

struct Card: Identifiable {
    var id: UUID = UUID()
    
    let suit: CardSuit
    let value: CardValue
}

struct CardView: View {
    let card: Card
    
    
    
    var body: some View {
        VStack {
            HStack {
                card.suit.sf
                    .font(.largeTitle)
                Spacer()
            }
            Spacer()
            Text(card.value.cardValue)
                .font(.largeTitle)
            Spacer()
            HStack {
                Spacer()
                card.suit.sf
                    .font(.largeTitle)
            }
        }
        .frame(width: 80, height: 140, alignment: .center)
        .padding()
        .background(Color.white.shadow(radius: 3))
    
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(suit: .club,
                            value: .queen))
    }
}
