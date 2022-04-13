//
//  Design.swift
//  GeoTrivia
//
//  Created by Hayden Couch on 2022-04-12.
//

import Foundation
import SwiftUI

extension Text {
    func orangeTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
