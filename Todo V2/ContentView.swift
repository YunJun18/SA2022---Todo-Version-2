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
                //we do bindings to ensure that when we click on mark as complete button, the task on main sheet is striked
                //ForEach to apply new modifiers (ondelete, onmove)
                ForEach($todos) { $todo in
                    NavigationLink {
                        TodoDetailView(todo: $todo)
                        //which view to go to [todoDetailView]
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
                    //this is under ForEach
                }
                .onMove { oldOffset, newOffset in
                    todos.move(fromOffsets: oldOffset, toOffset: newOffset)
                    ///under onDelete; to move tasks around
                }
            }
            .navigationTitle("Skill Issues")
            .toolbar {
                //adding the edit
                //leading : left; trailing : right
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                //add the plus button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                       isSheetGiven = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        //this is to go under navigation view
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

