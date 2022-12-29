//
//  NoteViewController.swift
//  Notes
//
//  Created by M_955328 on 2/18/22.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    var noteTitle: String = ""
    var note: String = ""
    
    var completedField: ((String, String) -> Void)!


    override func viewDidLoad() {
        super.viewDidLoad()
//        titleLabel.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(didTapSave))


        // Do any additional setup after loading the view.
        
        titleLabel.text = noteTitle
        noteLabel.text = note
    }
    
    @objc func didTapSave(){
        if let text = titleLabel.text, !text.isEmpty, !noteLabel.text!.isEmpty{
            completedField(text, noteLabel.text!)
        }
    }

}
