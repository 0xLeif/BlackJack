//
//  CardView.swift
//  BlackJack
//
//  Created by Zach Eriksen on 10/23/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

enum CardSuit: String {
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
}

struct Card {
    let suit: CardSuit
    let value: CardValue
}

struct CardView: View {
    let card: Card
    
    var cardValue: String {
        switch card.value {
        case .ace:
            return "\(1)"
        case .number(let value):
            return "\(value)"
        case .jack, .queen, .king:
            return "\(10)"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                card.suit.sf
                    .font(.largeTitle)
                Spacer()
            }
            Spacer()
            Text(self.cardValue)
                .font(.largeTitle)
            Spacer()
            HStack {
                Spacer()
                card.suit.sf
                    .font(.largeTitle)
            }
        }
        .padding()
        .background(Color.white.shadow(radius: 9))
    
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(suit: .club,
                            value: .queen))
    }
}
