//
//  NewProfileViewController.swift
//  SERS
//
//  Created by Kyle Rohlfing and Noah Nemec on 11/11/21.
//
import UIKit
class NewProfileViewController: SuperViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var enterTextLabel: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lNameLabel: UILabel!
    @IBOutlet weak var fNameLabel: UILabel!
    @IBOutlet weak var fnameField: UITextField!
    @IBOutlet weak var lnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumField: UITextField!
    
    var fullName: Optional = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fnameField.delegate = self
        self.lnameField.delegate = self
        self.emailField.delegate = self
        self.phoneNumField.delegate = self
        hideLabels()
        loadFields()
        
        self.resetBtn.isHidden = false
        self.enterTextLabel.isHidden = true
        
    }
    
    func hideFields() {
        fnameField.isHidden = true
        lnameField.isHidden = true
        emailField.isHidden = true
        phoneNumField.isHidden = true
    }
    func showFields() {
        fnameField.isHidden = false
        lnameField.isHidden = false
        emailField.isHidden = false
        phoneNumField.isHidden = false
    }
    func hideLabels() {
        fNameLabel.isHidden = true
        lNameLabel.isHidden = true
        emailLabel.isHidden = true
        phoneNumLabel.isHidden = true
    }
    func showLabels() {
        fNameLabel.isHidden = false
        lNameLabel.isHidden = false
        emailLabel.isHidden = false
        phoneNumLabel.isHidden = false
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.fnameField:
            self.lnameField.becomeFirstResponder()
        case self.lnameField:
            self.emailField.becomeFirstResponder()
        case self.emailField:
            self.phoneNumField.becomeFirstResponder()
        default:
            self.phoneNumField.resignFirstResponder()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    func loadFields() {
        if UDM.shared.defaults.value(forKey: "firstName") != nil {
            if let value = UDM.shared.defaults.value(forKey: "firstName") as? String {
                fNameLabel.isHidden = false
                fNameLabel.text = value
                fnameField.isHidden = true
 
            }
        }
        if UDM.shared.defaults.value(forKey: "lastName") != nil {
            if let value = UDM.shared.defaults.value(forKey: "lastName") as? String {
                lNameLabel.isHidden = false
                lNameLabel.text = value
                lnameField.isHidden = true

            }
        }
        if UDM.shared.defaults.value(forKey: "emailAddr") != nil {
            if let value = UDM.shared.defaults.value(forKey: "emailAddr") as? String {
                emailLabel.isHidden = false
                emailLabel.text = value
                emailField.isHidden = true

            }
        }
        if UDM.shared.defaults.value(forKey: "phoneNumber") != nil {
            if let value = UDM.shared.defaults.value(forKey: "phoneNumber") as? String {
                phoneNumLabel.isHidden = false
                phoneNumLabel.text = value
                phoneNumField.isHidden = true

            }
        }
    }
    
    @IBAction func resetDefaults(_ sender: UIButton) {
//        print("button tapped")
        UDM.shared.defaults.removeObject(forKey: "firstName")
        UDM.shared.defaults.removeObject(forKey: "lastName")
        UDM.shared.defaults.removeObject(forKey: "emailAddr")
        UDM.shared.defaults.removeObject(forKey: "phoneNumber")
        hideLabels()
        showFields()
        self.submitBtn.isHidden = false
        self.resetBtn.isHidden = true
    }
    
    
    

    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
//        print("Submit button pressed!")
        let identifier = UUID()

//        print("\(fnameField.text ?? "") \(lnameField.text ?? "")")
        fullName = "\(fnameField.text ?? "") \(lnameField.text ?? "")"
        
        
//        var userFirst: String = UDM.shared.defaults.value(forKey: "firstName") as! String
//        var userLast: String = UDM.shared.defaults.value(forKey: "lastName") as! String
        
//        if let first = UDM.shared.defaults.value(forKey: "firstName"), let last = UDM.shared.defaults.value(forKey: "lastName") {
//            self.fullName = "\(first) \(last)"
//
//        }

        
        if let Fname = self.fnameField.text, Fname.isEmpty, let Lname = self.lnameField.text, Lname.isEmpty {
            self.enterTextLabel.isHidden = false
            self.enterTextLabel.text = "Plese Enter a Value"
        } else {
           print("Text Field is not empty")
            
            self.resetBtn.isHidden = false
            self.submitBtn.isHidden = true
            
            UDM.shared.defaults.set(fnameField.text, forKey: "firstName")
            UDM.shared.defaults.set(lnameField.text, forKey: "lastName")
            UDM.shared.defaults.set(emailField.text, forKey: "emailAddr")
            UDM.shared.defaults.set(phoneNumField.text, forKey: "phoneNumber")
            UDM.shared.defaults.set(identifier.uuidString, forKey: "id")
            UDM.shared.defaults.set(fullName, forKey: "fullName")
            
            loadFields()
        }
//        loadFields()
//        showLabels()
//        hideFields()

        
        
        
        

    }
}



