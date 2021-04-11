//
//  GetNotes.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 10.04.2021.
//

import Foundation

struct DailyGetDocuments {
    
    var title = String()
    var date = String()
    var note = String()
    var isItDone = String()
    
    init(title: String, date: String, note: String, isItDone: String) {
        self.title = title
        self.date = date
        self.note = note
        self.isItDone = isItDone
    }
}

struct GetDocuments {
    var title = [String]()
    var date = [String]()
    var note = [String]()
    var isItDone = [String]()
    
//    init(title: [String], date: [String], note : [String], isItDone: [String]) {
//        self.title = title
//        self.date = date
//        self.note = note
//        self.isItDone = isItDone
//    }
}

