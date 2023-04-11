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
    
    //Access the connection to the database (needed to add a new record)
    @Environment(\.blackbirdDatabase) var dbmm: Blackbird.Database?
    
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
                        
                        Task{
                            //Write to database
                            try await dbmm!.transaction { core in
                                try core.query("INSERT INTO MoodItem (description) VALUES (?)", newMood)
                            }
                            
                            //Clear the input field
                            newMood = ""
                        }
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                    })
                    
                }
                .padding(20)
                
                List {
                    
                    ForEach (moodItems.results) { currentItem in
                        
                        Text(currentItem.description)
                        
                    }.onDelete(perform: removeRows)
                }
                
            }
            .navigationTitle("Mood Mapper")
        }
    }
    
    //MARK: Functions
    func removeRows(at offsets: IndexSet) {
        
        Task{
            try await dbmm!.transaction { core in
                
                //Get ID of item to be deleted
                var idList = ""
                for offset in offsets {
                    idList += "\(moodItems.results[offset].id),"
                }
                
                //Remove final comma
                print(idList)
                idList.removeLast()
                print(idList)
                
                //Delete the row from the database
                try core.query("DELETE FROM MoodItem WHERE id IN (?)", idList)
            }
        }
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
