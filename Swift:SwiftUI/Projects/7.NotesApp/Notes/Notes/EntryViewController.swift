//
//  EntryViewController.swift
//  Notes
//
//  Created by M_955328 on 2/18/22.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    var completedField: ((String, String) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(didTapSave))

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapSave(){
        if let text = titleField.text, !text.isEmpty, !noteField.text!.isEmpty{
            completedField(text, noteField.text!)
        }
    }
    
}

