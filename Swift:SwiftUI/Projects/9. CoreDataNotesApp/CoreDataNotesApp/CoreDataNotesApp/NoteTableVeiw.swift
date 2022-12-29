//
//  NoteTableVeiw.swift
//  CoreDataNotesApp
//
//  Created by M_955328 on 2/27/22.
//

import Foundation
import UIKit
import CoreData

class NoteTableView: UITableViewController{
    
    var firstLoad = true
    var noteList = [Note]()
    override func viewDidLoad() {
        

        if(firstLoad){
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results{
                    let note = result as! Note
                    noteList.append(note)
                }
            } catch  {
                print("Fetch failed")
            }
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCellID", for: indexPath) as! NoteCell
        
        let thisNote: Note!
        thisNote = noteList[indexPath.row]
        noteCell.noteTitleLabel.text = thisNote.title
        noteCell.noteDesripLabel.text = thisNote.descrip
        
        
        
        return noteCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
//    override func numberOfRow(in tableView: UITableView) -> Int {
//        return noteList.count
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            for result in results{
                let note = result as! Note
                noteList.append(note)
            }
        } catch  {
            print("Fetch failed")
        }

        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editNote", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if(segue.identifier == "editNote")
        {
            let indexPath = tableView.indexPathForSelectedRow!
            
            let noteDetail = segue.destination as? NoteDetailVC
            noteDetail!.noteList = noteList
            
            let selectedNote : Note
            selectedNote = noteList[indexPath.row]
            noteDetail?.selectedNote = selectedNote
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
