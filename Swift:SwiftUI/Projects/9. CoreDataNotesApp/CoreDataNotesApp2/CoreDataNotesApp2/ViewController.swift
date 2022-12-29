//
//  ViewController.swift
//  CoreDataNotesApp2
//
//  Created by M_955328 on 2/28/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    private var notes = [Notes]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    }
//
    @objc private func didTapAddButton(){
        let alert = UIAlertController(title: "New Item", message: "Enter New Item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
            guard let field = alert.textFields?.first, let text = field.text, text.isEmpty else{
            return
            }
            self?.createItems(name: text)
    }))
        present(alert, animated: true)
}
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        let cell = NoteCell(style: .default, reuseIdentifier: "NoteCell")
        cell.textLabel?.text = note.title
        return cell
    }
    
    
    
    

    
    
//    MARK: - Core Data
    
    func getAllItems(){
        do{
            notes = try context.fetch(Notes.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print("Error fetching items")
        }
        
    }
    
    func createItems(name: String){
        let newItem = Notes(context: context)
        newItem.title = title
        newItem.descrip = description
        newItem.createdAt = Date()
        
        do{
            try context.save()
            getAllItems()
        }catch{
            print("Could not create")
        }
        
    }
    
    func deleteItem(item: Notes){
        context.delete(item)
        do {
            try context.save()
        }catch{
            print("Could not delete")
        }
        
    }
    
    func updateItem(item: Notes, newTitle: String, newDescription: String){
        item.title = newTitle
        item.descrip = newDescription
        do {
            try context.save()
        }catch{
            print("Could not update")
        }
    }


}

