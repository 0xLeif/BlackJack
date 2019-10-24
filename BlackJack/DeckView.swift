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
    var body: some View {
        List {
            ForEach(self.deck.cards) { card in
                NavigationLink(destination: CardView(card: card)) {
                    HStack {
                        card.suit.sf
                        Spacer()
                        Text("\(card.value.cardValue)")
                    }
                }
                
            }
        }
        .navigationBarTitle("Deck View")
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
