//
//  GameView.swift
//  GeoTrivia
//
//  Created by Hayden Couch on 2022-04-12.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var guessManager: GuessManager
   
    var body: some View {
        if guessManager.reachedEnd {
            VStack(spacing: 20) {
               Text("Geo Guesser")
                    .orangeTitle()
                
                Text("You made it to the end!")
                
                Text("You scored \(guessManager.score) out of \(guessManager.length)")
                
                Button {
                    Task.init {
                        await guessManager.fetchGuess()
                    }
                } label: {
                    PrimaryButton(text: "Play Again!")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.181, green: 0.197, blue: 0.32))
        } else {
            GuessView()
                .environmentObject(guessManager)
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GuessManager())
    }
}

