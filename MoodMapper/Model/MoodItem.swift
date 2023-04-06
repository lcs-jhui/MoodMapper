//
//  MoodItem.swift
//  MoodMapper
//
//  Created by Justin Hui on 5/4/2023.
//

import Foundation

struct MoodItem: Identifiable{
    var id: Int
    var mood: String
}

var existingMoodItems = [

    MoodItem(id: 1, mood: "😃 HAPPY")
    
    ,

    MoodItem(id: 2, mood: "😃 SAD")
    
    ,

    MoodItem(id: 3, mood: "😃 ANGRY")
    
    ,

]
