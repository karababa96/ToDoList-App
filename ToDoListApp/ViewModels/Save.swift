//
//  Save.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 10.04.2021.
//

import Foundation
import Firebase



class SaveNote {
    
    func saveData(collectionName: String, titleInput : String, dateInput: String, noteInput: String, isItDone: String, documentId : String) {
        let dataBase = Firestore.firestore()
        
        
     var reference : DocumentReference? = nil
        
     let notes = SaveNotes(title: "title", date: "date", note: "note", isItDone: "Done", documentID: "documentID")
        
        
        reference = dataBase.collection(collectionName).addDocument(data:
            [
                notes.title : titleInput,
                notes.date : dateInput,
                notes.note : noteInput,
                notes.isItDone : isItDone,
                notes.documentID : documentId
            
            ]) { (error) in
            if let error = error {
                    print(error.localizedDescription)
                }else {
                    print("Successfully saved")
                    
                }
            }
    }
    
    
}
