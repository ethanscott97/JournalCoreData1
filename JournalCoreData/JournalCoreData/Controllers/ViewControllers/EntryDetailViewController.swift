//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Ethan Scott on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        
    }
    
     var entry: Entry?
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text,  !body.isEmpty else {return}
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = body
            EntryController.sharedInstance.updateEntry(entry)
        }else{
            EntryController.sharedInstance.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    
    //MARK: - Functions
    func updateViews() {
        guard let entry = entry else {return}
        titleTextField.text = entry.title
        bodyTextField.text = entry.bodyText
    }
    
    /*
     // MARK: - Navigation
     s
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
