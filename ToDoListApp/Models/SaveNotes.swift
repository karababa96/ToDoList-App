//
//  SaveNotes.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 10.04.2021.
//

import Foundation

struct SaveNotes {
    var title = String()
    var date = String()
    var note = String()
    var isItDone = String()
    var documentID = String()
    
    init(title: String, date: String, note: String, isItDone: String, documentID : String) {
        self.title = title
        self.date = date
        self.note = note
        self.isItDone = isItDone
        self.documentID = documentID
    }
}
