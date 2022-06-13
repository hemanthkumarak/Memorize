//
//  ContentView.swift
//  Memorize
//
//  Created by A.k. Hemanth Kumar on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                ForEach(viewModel.cards)
                                 {card in CardView(card: card)
                                        .aspectRatio(2/3, contentMode: .fit)
                                        .onTapGesture {
                                            viewModel.choose(card)
                                        }
                    
                }   })
            
        }
            .foregroundColor(Color.blue)
            .padding(.horizontal)
            .font(.largeTitle)
        }
    
    }


struct CardView: View {
    
    var card: MemoryGame<String>.Card

    let shape = RoundedRectangle(cornerRadius: 20.0)
    
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(.blue)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill(.blue)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
