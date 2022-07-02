//
//  Todo.swift
//  Todo V2
//
//  Created by T Krobot on 2/7/22.
//

import Foundation

struct Todo: Identifiable {
    
    var id = UUID()
    var title: String
    var isCompleted = false
    
}
