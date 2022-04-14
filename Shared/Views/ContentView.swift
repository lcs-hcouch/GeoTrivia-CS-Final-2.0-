//
//  ContentView.swift
//  Shared
//
//  Created by Hayden Couch on 2022-04-12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var guessManager = GuessManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                Text("Geo Guesser")
                    .orangeTitle()

                    Text("How many can you get?")
                        .foregroundColor(Color("AccentColor"))
                }
            .padding(40)
                
                NavigationLink {
                    GuessView()
                        .environmentObject(guessManager)
                } label: {
                    PrimaryButton(text: "Start!")
                }
        
            }
            .frame (maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.181, green: 0.197, blue: 0.32))
    }
        }
            }


struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

