//
//  DetailViewController.swift
//  To Do List
//
//  Created by Claudia Yang on 9/23/19.
//  Copyright © 2019 Claudia Yang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var toDoNoteView: UITextView!
    var toDoItem: String?
    var toDoNoteItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    func enableDisableSaveButton(){
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
    }
    }

    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentinginAddMode = presentingViewController is UINavigationController
        if isPresentinginAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
