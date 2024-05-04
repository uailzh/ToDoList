//
//  User.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import Foundation

struct User:Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
