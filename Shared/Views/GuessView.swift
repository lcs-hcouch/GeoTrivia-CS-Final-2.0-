//
//  GuessView.swift
//  GeoTrivia
//
//  Created by Hayden Couch on 2022-04-12.
//

import SwiftUI

struct GuessView: View {
    @EnvironmentObject var guessManager: GuessManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Geo Guesser")
                    .orangeTitle()
                
                Spacer()
                
                Text("\(guessManager.index + 1)out of \(guessManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text(guessManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor((Color("AccentColor")))
                    .padding()
                
                ForEach(guessManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(guessManager)
                }
            }
            
            Button {
                guessManager.nextQuestion()
            } label: {
                PrimaryButton(text: "Continue!", background: guessManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity:0.327))
            }
            .disabled(!guessManager.answerSelected)
            
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.181, green: 0.197, blue: 0.32))
        .navigationBarHidden(true)
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView()
            .environmentObject(GuessManager())
    }
}
