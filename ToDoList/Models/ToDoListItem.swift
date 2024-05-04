//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id:String
    let title:String
    let dueDate:TimeInterval
    let currentDate:TimeInterval
    var isDone:Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
