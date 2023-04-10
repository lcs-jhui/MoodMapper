//
//  MoodView.swift
//  MoodMapper
//
//  Created by Justin Hui on 5/4/2023.
//

import Blackbird
import SwiftUI

struct MoodView: View {
    
    //MARK: Stored Properties
    
    
    //List of moods
    @BlackbirdLiveModels({ dbmm in
        try await MoodItem.read(from: dbmm)
    }) var moodItems
    
    //Current item being added
    @State var newMood: String = ""
    
    //MARK: Computed Properties
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                Text("How are you feeling?")
                
                HStack{
                    
                    TextField("Enter emoji", text: $newMood)
                    
                    Button(action: {
                        
                        //Get last item ID
                        let lastId = moodItems.last!.id
                        
                        //Create the new item ID
                        let newId = lastId + 1
                        
                        //New mood item
                        let newMoodItem = MoodItem(id: newId, mood: newMood)
                        
                        //Add the new item to the list
                        moodItems.append(newMoodItem)
                        
                        //Clear input field
                        newMood = ""
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                    })
                    
                }
                .padding(20)
                
                List (moodItems.results) { currentItem in
                    
                        Text(currentItem.mood)
                    
                }
                
            }
            .navigationTitle("Mood Mapper")
        }
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
