//
//  DeckView.swift
//  BlackJack
//
//  Created by Zach Eriksen on 10/23/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

struct Deck {
    let cards: [Card] = {
        var cards: [Card] = CardSuit.allCases.flatMap { suit in
            return (0 ... 13).map { value in
                let cardValue: CardValue
                switch value {
                case 0:
                    cardValue = .ace
                case 1 ... 10:
                    cardValue = .number(value: value)
                case 11:
                    cardValue = .jack
                case 12:
                    cardValue = .queen
                case 13:
                    cardValue = .king
                default:
                    cardValue = .ace
                }
                return Card(suit: suit, value: cardValue)
            }
        }
        return cards
    }()
}

struct DeckView: View {
    let deck = Deck()
    @State private var angle: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach((0 ..< self.deck.cards.count), id: \.self) { cardIndex in
                    CardView(card: self.deck.cards[cardIndex])
                        .frame(width: 20, height: 35, alignment: .center)
                        .rotationEffect(.init(degrees: Double(cardIndex) * self.angle), anchor: .bottomTrailing)
                        .animation(.easeInOut(duration: 3))
                    
                }
            }
            Spacer()
            Slider(value: $angle, in: (0 ... 90))
        }
    .padding()
        .navigationBarTitle("Deck View")
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
