//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by A.k. Hemanth Kumar on 3/12/21.
//

import Foundation
import SwiftUI

class EmojiMemoryGame:ObservableObject {
    
    static var emojis = ["🚗", "🚌", "🏎", "🚑", "🚒", "🛻", "🚚",
                    "🚛", "🚜", "🚲", "🛵", "🏍", "🛺",
                    "🚃", "🚄", "🚂", "✈️", "🚀", "🚁",
                    "⛵️", "🚢", "🛰", "🛸"]
    
    @Published var model = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: {pairIndex in emojis[pairIndex]})
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
