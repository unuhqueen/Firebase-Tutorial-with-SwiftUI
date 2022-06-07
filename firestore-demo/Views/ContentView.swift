//
//  ContentView.swift
//  firestore-demo
//
//  Created by Seungwon Choi on 2022/06/07.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    
    @State var name = ""
    @State var notes = ""
    
    var body: some View {
        
        VStack {
            List (model.list) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    
                    // Update Button
                    Button(action: {
                        
                        // Update todo
                        model.updateData(todoToUpdate: item)
                    }, label: {
                        Image(systemName: "pencil")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                    // Delete Button
                    Button(action: {
                        
                        // Delete todo
                        model.deleteData(todoToDelete: item)
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            VStack(spacing: 5) {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Notes", text: $notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    
                    // Call add data
                    model.addData(name: name, notes: notes)
                    
                    // Clear the text fields
                    name = ""
                    notes = ""
                    
                }, label: {
                    Text("Add Todo Item")
                })
            }
            .padding()
        }
        
    }
    
    init() {
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
