//
//  Take.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 10.04.2021.
//

import Foundation
import Firebase


class getNote {
    
    var titleArray : [String]
    var dateArray :  [String]
    var noteArray : [String]
    
    init(titleArray : [String], dateArray : [String], noteArray : [String]) {
        self.titleArray = titleArray
        self.noteArray = noteArray
        self.dateArray = dateArray
    }
}
   
