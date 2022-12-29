//
//  ViewController.swift
//  CoreDataNotesApp
//
//  Created by M_955328 on 2/27/22.
//

import UIKit
import CoreData


class NoteDetailVC: UIViewController{

    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    var noteList = [Note]()
    
//    var completedField: (([noteList]) -> Void)!
    
    var selectedNote: Note? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectedNote != nil){
            noteTextField.text = selectedNote?.title
            noteTextView.text = selectedNote?.descrip
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedNote == nil){
            let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
            let newNote = Note(entity: entity!, insertInto: context)
            newNote.id = noteList.count as NSNumber
            newNote.title = noteTextField.text
            newNote.descrip = noteTextView.text
            do{
                try context.save()
//                completedField(noteList)
                print(noteList)
            }
            catch{
                print("Context save error")
            }
            noteList.append(newNote)
            navigationController?.popToRootViewController(animated: true)
        }
        else{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results{
                    let note = result as! Note
                    if(note == selectedNote){
                        note.title = noteTextField.text
                        note.descrip = noteTextView.text
                        try context.save()
                        navigationController?.popToRootViewController(animated: true)
                    }
                }
            } catch  {
                print("Fetch failed")
            }
        }
    }
    
}
    

