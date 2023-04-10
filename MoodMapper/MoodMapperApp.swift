//
//  MoodMapperApp.swift
//  MoodMapper
//
//  Created by Justin Hui on 5/4/2023.
//

import Blackbird
import SwiftUI

@main
struct MoodMapperApp: App {
    var body: some Scene {
        WindowGroup {
            MoodView()
                //Make the database avaiable to all other views through the environment
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
