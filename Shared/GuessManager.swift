//
//  GuessManager.swift
//  GeoTrivia
//
//  Created by Hayden Couch on 2022-04-12.
//

import Foundation
import SwiftUI

class GuessManager: ObservableObject {
    private(set) var guess: [Guess.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    
    
    init() {
        Task.init {
            await fetchGuess()
        }
    }
    
    func fetchGuess() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=35&category=22&type=multiple") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Guess.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.reachedEnd = false
                
                self.guess = decodedData.results
                self.length = self.guess.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching game: \(error)")
        }
    }
        
        func nextQuestion() {
            if index + 1 < length {
                index += 1
                setQuestion()
            } else {
                reachedEnd = true
            }
        }
        
        func setQuestion() {
            answerSelected = false
            
            if index < length {
                let currentGeoQuestion = guess[index]
                question = currentGeoQuestion.formattedQuestion
                answerChoices = currentGeoQuestion.answers
            }
        }
        
        func selectAnswer(answer: Answer) {
            answerSelected = true
            if answer.isCorrect {
                score += 1
            }
        }
        
    
}
