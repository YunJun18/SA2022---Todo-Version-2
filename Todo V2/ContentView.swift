//
//  ContentView.swift
//  Todos v2
//
//  Created by YJ Soon on 2/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Work on my skill issues"),
        Todo(title: "Watch some Paw Patrol episodes"),
        Todo(title: "Delete everyone's points"),
        Todo(title: "Gotten hot chocolate", isCompleted: true)
    ]
    
    @State var isSheetGiven = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todos) { $todo in
                    NavigationLink {
                        TodoDetailView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                        }
                    }
                }
                .onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                }
                .onMove { oldOffset, newOffset in
                    todos.move(fromOffsets: oldOffset, toOffset: newOffset)
                }
            }
            .navigationTitle("Skill Issues")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                       isSheetGiven = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetGiven) {
            NewTodoView(todos: $todos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

