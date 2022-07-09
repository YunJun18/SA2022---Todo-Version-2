//
//  TodoDetailView.swift
//  Todo V2
//
//  Created by T Krobot on 2/7/22.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        VStack {
            TextField("Please enter a title", text: $todo.title)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button {
                todo.isCompleted.toggle()
                //toggle in the literate meaning
            } label: {
                Text("Mark as \(todo.isCompleted ? "incomplete" : "complete")")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(todo.isCompleted ? .red : .green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
            //don't add any more navigation views, it would follow the one in content view
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(title: "Not get hot chocolate")))
        //basically showing the format of info typed
    }
}
