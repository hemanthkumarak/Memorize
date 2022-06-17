//
//  MemorizeApp.swift
//  Memorize
//
//  Created by A.k. Hemanth Kumar on 12/11/21.
//

import SwiftUI
import GoogleSignIn

//@main
//struct MemorizeApp: App {
//    var body: some Scene {
//        let game = EmojiMemoryGame()
//        WindowGroup {
//            EmojiMemoryGameContentView(viewModel: game)
//
//        }
//    }
//}

import SwiftUI
import GoogleSignIn

@main
struct DaysUntilBirthday: App {
  @StateObject var authViewModel = AuthenticationViewModel()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(authViewModel)
        .onAppear {
          GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let user = user {
              self.authViewModel.state = .signedIn(user)
            } else if let error = error {
              self.authViewModel.state = .signedOut
              print("There was an error restoring the previous sign-in: \(error)")
            } else {
              self.authViewModel.state = .signedOut
            }
          }
        }
        .onOpenURL { url in
          GIDSignIn.sharedInstance.handle(url)
        }
    }
  }
}

