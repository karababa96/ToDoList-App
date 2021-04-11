//
//  NewNoteViewController.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 9.04.2021.
//

import UIKit

class NewNoteViewController: UIViewController {

    let noteText = UITextView()
    let titleText = UITextView()
    let saveButton = UIButton()
    
    var selectedTitleText = String()
    var selectedNoteText = String()
    
    var collectionName = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        noteText.layer.borderWidth = 2
        noteText.layer.borderColor = UIColor.black.cgColor
        noteText.font = UIFont(name: "Times New Roman", size: 24)
        noteText.frame = CGRect(x: 20, y: 250, width: view.frame.width - 50 , height: view.frame.height / 5)
        view.addSubview(noteText)
        
        
        titleText.layer.borderWidth = 2
        titleText.layer.borderColor = UIColor.black.cgColor
        titleText.font = UIFont(name: "Times New Roman", size: 24)
        titleText.frame = CGRect(x: 20, y: 200, width: view.frame.width - 50 , height: 40)
        view.addSubview(titleText)

        
        saveButton.frame = CGRect(x: view.frame.width / 2 - 50, y: view.frame.height-200-view.safeAreaInsets.bottom, width: 100, height: 40)
        saveButton.layer.borderWidth = 2
        saveButton.layer.cornerRadius = 9
        saveButton.setTitle("Save Note!", for: .normal)
        saveButton.setTitleColor(UIColor.black, for: .normal)
        saveButton.layer.borderColor = UIColor.black.cgColor
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(saveButton)
        
        noteText.text = selectedNoteText
        titleText.text = selectedTitleText
    }
    
    @objc func saveAction() {
        let save = SaveNote()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let currentDate = formatter.string(from: date)
        let id = UUID().uuidString
        save.saveData(collectionName: "\(collectionName)", titleInput: titleText.text , dateInput: currentDate, noteInput: noteText.text, isItDone: "1", documentId: id)
        navigationController?.popToRootViewController(animated: true)
    }
    

   

}
