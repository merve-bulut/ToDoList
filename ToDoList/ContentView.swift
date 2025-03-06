//
//  ContentView.swift
//  ToDoList
//
//  Created by Merve Bulut on 6.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = []
    @State private var newTask: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add Task...", text: $newTask)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                  
                  Button(action: {
                    if !newTask.isEmpty {
                            tasks.append(newTask)
                            newTask = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                              
                  List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete { indexSet in
                        tasks.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ContentView()
}
