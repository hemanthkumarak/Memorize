//
//  MemoryGame.swift
//  Memorize
//
//  Created by A.k. Hemanth Kumar on 30/11/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    
    
    var cards: Array<Card>
    
    init(numberOfPairsOfCards:Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    func index(of card:Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil //todo: Fix this!
    }
    
    struct Card:Identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
