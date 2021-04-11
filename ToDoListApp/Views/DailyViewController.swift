//
//  DailyViewController.swift
//  ToDoListApp
//
//  Created by Ali Karababa on 9.04.2021.
//

import UIKit
import Firebase

class DailyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var titleArray = [String]()
    var noteArray = [String]()
    var dateArray = [String]()
    var documentIDArray = [String]()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(tableView)
        
        let addButton = UIButton()
        addButton.frame = CGRect(x: view.frame.width - 100, y: view.frame.height - 175 , width: 50, height: 50)
        addButton.alpha = 0.5
        addButton.layer.cornerRadius = 10
        addButton.layer.masksToBounds = true
        addButton.layer.borderWidth = 1
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.addTarget(self, action: #selector(addNewNote), for: .touchUpInside)
        view.addSubview(addButton)
        
        self.tableView.reloadData()
        
        DispatchQueue.main.async {
            self.getDataDaily()
            self.tableView.reloadData()
        }
        self.tableView.reloadData()
    }
    func getDataDaily() {
      
        let dataBase = Firestore.firestore()
        
        dataBase.collection("DailyNotes").addSnapshotListener { (snapshot, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }else {
                    if snapshot?.isEmpty == false && snapshot != nil {
                        self.titleArray.removeAll(keepingCapacity: false)
                        self.noteArray.removeAll(keepingCapacity: false)
                        self.dateArray.removeAll(keepingCapacity: false)
                        self.documentIDArray.removeAll(keepingCapacity: false)

                        for document in snapshot!.documents {
                            if let title = document.get("title") as? String {
                                self.titleArray.append(title)
                             if let note = document.get("note") as? String {
                                self.noteArray.append(note)
                             if let date = document.get("date") as? String {
                                self.dateArray.append(date)
                             if let documentID = document.documentID as? String {
                                self.documentIDArray.append(documentID)
                                            }
                                        }
                                    }
                                }
                    }
                }
                    
            }
            self.tableView.reloadData()
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = NewNoteViewController()
        vc.selectedTitleText = titleArray[indexPath.row]
        vc.selectedNoteText = noteArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
        
      
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let dataBase = Firestore.firestore()
            
            dataBase.collection("DailyNotes").document(self.documentIDArray[indexPath.row]).delete { (error) in
                if error != nil {
                    print(error?.localizedDescription)
                }else {
                    print("Successfully Deleted")
                    
                    
                }
            }
           
            self.titleArray.removeAll(keepingCapacity: false)
            self.tableView.reloadData()
        }
       
        
    }
    
    @objc func addNewNote() {
        let newNoteViewController = NewNoteViewController()
        let collection = "DailyNotes"
        newNoteViewController.collectionName = collection
        newNoteViewController.title = title
        navigationController?.pushViewController(newNoteViewController, animated: false)
    }
    
    
    
}
    

