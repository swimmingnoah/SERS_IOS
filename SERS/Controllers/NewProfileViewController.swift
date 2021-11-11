//
//  NewProfileViewController.swift
//  SERS
//
//  Created by Kyle Rohlfing on 11/11/21.
//

import UIKit
import Firebase

class NewProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var fnameField: UITextField!
    @IBOutlet weak var lnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumField: UITextField!
    
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        print("Submit button pressed!")
        
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
//        let userID = Auth.auth().currentUser?.uid
        
        let fname = fnameField.text!
        let lname = lnameField.text!
        let email = emailField.text!
        let phoneNum = phoneNumField.text!
        
        print(fname, lname, email, phoneNum)
        
        
    }

}
