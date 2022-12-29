//
//  ViewController.swift
//  Notes
//
//  Created by M_955328 on 2/18/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, note: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Notes"
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController else{
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completedField = {text, noteField
        in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: text, note: noteField))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
      let model = models[indexPath.row]
        
       //Show note controller
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else{
            return
        }
//        vc.navigationItem.largeTitleDisplayMode = .never
//        vc.title = "Note"
//        vc.completedField = {noteTitle, note in
//            self.navigationController?.popToRootViewController(animated: true)
//            self.models[indexPath.row].title = noteTitle
//            self.models[indexPath.row].note = note
//            self.table.reloadData()
//        }
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}



