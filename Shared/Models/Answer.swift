//
//  Answer.swift
//  GeoTrivia
//
//  Created by Hayden Couch on 2022-04-12.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
