//
//  NewTodoView.swift
//  Todo V2
//
//  Created by T Krobot on 2/7/22.
//

import SwiftUI

struct NewTodoView: View {
    
    @State var todoTitle = ""
    @Binding var todos: [Todo]
    //using binding when you need info from somewhere else to modify it on your side
    
    @Environment(\.dismiss) var dismiss //maake sheet go away on its own kind of like a func
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        //form meanings presenting everything in bars
        Form {
            TextField("Enter todo name", text: $todoTitle)
            
            Button("Save Todo"){
                todos.append(Todo(title: todoTitle))
                dismiss()
                //presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(todos: .constant([]))
    }
}
