//
//  NewProfileViewController.swift
//  SERS
//
//  Created by Kyle Rohlfing on 11/11/21.
//
import UIKit
import Firebase
class NewProfileViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var phoneNumLabel: UILabel!

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lNameLabel: UILabel!
    @IBOutlet weak var fNameLabel: UILabel!
    @IBOutlet weak var fnameField: UITextField!
    @IBOutlet weak var lnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fnameField.delegate = self
        self.lnameField.delegate = self
        self.emailField.delegate = self
        self.phoneNumField.delegate = self
        
        fNameLabel.isHidden = true
        lNameLabel.isHidden = true
        emailLabel.isHidden = true
        phoneNumLabel.isHidden = true    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        print("Submit button pressed!")
        
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
//        let userID = Auth.auth().currentUser?.uid
        
        fnameField.isHidden = true
        lnameField.isHidden = true
        emailField.isHidden = true
        phoneNumField.isHidden = true
        
        UDM.shared.defaults.set(fnameField.text, forKey: "fName")
        UDM.shared.defaults.set(lnameField.text, forKey: "lName")
        UDM.shared.defaults.set(emailField.text, forKey: "email")
        UDM.shared.defaults.set(phoneNumField.text, forKey: "phoneNum")
        if UDM.shared.defaults.value(forKey: "fName") != nil {
            if let value = UDM.shared.defaults.value(forKey: "fName") as? String {
                fNameLabel.isHidden = false
                fNameLabel.text = value
            }
        }
        if UDM.shared.defaults.value(forKey: "lName") != nil {
            if let value = UDM.shared.defaults.value(forKey: "lName") as? String {
                lNameLabel.isHidden = false
                lNameLabel.text = value
            }
        }
        if UDM.shared.defaults.value(forKey: "email") != nil {
            if let value = UDM.shared.defaults.value(forKey: "email") as? String {
                emailLabel.isHidden = false
                emailLabel.text = value
            }
        }
        if UDM.shared.defaults.value(forKey: "phoneNum") != nil {
            if let value = UDM.shared.defaults.value(forKey: "phoneNum") as? String {
                phoneNumLabel.isHidden = false
                phoneNumLabel.text = value
            }
        }
        

//        if let value = UDM.shared.defaults.value(forKey: "lName") as? String {
//            print(value)
//        }
//        if let value = UDM.shared.defaults.value(forKey: "email") as? String {
//            print(value)
//        }
//        if let value = UDM.shared.defaults.value(forKey: "phoneNum") as? String {
//            print(value)
//        }
//        print(userDefaults.value(forKey: "fName"))
//
//        let fname = fnameField.text!
//        let lname = lnameField.text!
//        let email = emailField.text!
//        let phoneNum = phoneNumField.text!
//        let fname = fnameField.text!
//        let lname = lnameField.text!
//        let email = emailField.text!
//        let phoneNum = phoneNumField.text!
        
//        print(fname, lname, email, phoneNum)
        let userData = [
            "fname": fnameField.text!,
            "lname": lnameField.text!,
            "email": emailField.text!,
            "phoneNum": phoneNumField.text!
        ]

//        print(userData)

    }
}


class UDM {
    static let shared = UDM()
    
    let defaults = UserDefaults()
    
//    suiteName: "com.noahnemec.SERS"
    
    
}
