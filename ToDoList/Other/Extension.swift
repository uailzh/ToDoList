//
//  Extension.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String:Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        }
        catch {
            return [:]
        }
        
    }
}
