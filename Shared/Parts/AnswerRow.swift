//
//  AnswerRow.swift
//  GeoTrivia
//
//  Created by Hayden Couch on 2022-04-12.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var guessManager: GuessManager
    var answer: Answer
    @State private var isSelected = false
    
    var green = Color(hue: 0.4, saturation: 0.7, brightness: 0.7)
    var red = Color(red: 0.7, green: 0.09, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "cirlce.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
                .foregroundColor(.white)
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(guessManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(Color("AccentColor"))
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !guessManager.answerSelected {
                isSelected = true
                guessManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(GuessManager())
    }
}
