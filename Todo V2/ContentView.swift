//
//  ContentView.swift
//  Todo V2
//
//  Created by T Krobot on 2/7/22.
//

import SwiftUI

struct ContentView: View {
    var todos = [
    Todo(title: "Work on skill issues"),
    Todo(title: "Paw patrol movies"),
    Todo(title: "Get hot chocolate", isCompleted: true),
    Todo(title: "win more points")
    ]
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                HStack {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    Text(todo.title)
                }
            }
            .navigationTitle("Skill Issues")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
