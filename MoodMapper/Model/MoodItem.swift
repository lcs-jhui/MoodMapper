//
//  MoodItem.swift
//  MoodMapper
//
//  Created by Justin Hui on 5/4/2023.
//

import Blackbird
import Foundation

struct MoodItem: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var description: String
    @BlackbirdColumn var completed: Bool
}

