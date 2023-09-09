//
//  Extensions.swift
//  TodoList
//
//  Created by Aman Bind on 09/09/23.
//

import Foundation

extension Encodable {
    func asDisctionary()->[String: Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do{
            
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }
        catch{
            return [:]
        }
                
    }
}
