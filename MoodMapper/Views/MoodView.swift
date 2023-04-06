//
//  MoodView.swift
//  MoodMapper
//
//  Created by Justin Hui on 5/4/2023.
//

import SwiftUI

struct MoodView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                
                Text("How are you feeling?")
                
                HStack{
                    
                    TextField("Enter emoji", text: Binding.constant(""))
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                    })
                    
                }
                .padding(20)
                
                List{
                    
                    HStack{
                        Text("😃")
                            .font(.title2)
                        Text("HAPPY")
                            .font(.title2)

                    }
                    
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
