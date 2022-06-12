//
//  MemorizeApp.swift
//  Memorize
//
//  Created by A.k. Hemanth Kumar on 12/11/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
