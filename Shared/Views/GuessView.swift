//
//  GuessView.swift
//  GeoTrivia
//
//  Created by Hayden Couch on 2022-04-12.
//

import SwiftUI

struct GuessView: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Geo Guesser")
                    .orangeTitle()
                
                Spacer()
                
                Text("1 out of 10")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("What European country is not a part of the EU?")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor((Color("AccentColor")))
                    .padding()
                
                AnswerRow(answer: Answer(text: "Norway", isCorrect: true))
                AnswerRow(answer: Answer(text: "Lithuania", isCorrect: false))
                AnswerRow(answer: Answer(text: "Ireland", isCorrect: false))
                AnswerRow(answer: Answer(text: "Czechia", isCorrect: false))
            }
            
            PrimaryButton(text: "Continue!")
            
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
    }
}
