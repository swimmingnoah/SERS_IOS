//
//  TipViewController.swift
//  SERS
//
//  Created by Kyle Rohlfing on 11/11/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class TipViewController: SuperViewController, UITextFieldDelegate {
    
    @IBOutlet weak var incidentTimeAndDate: UIDatePicker!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var incidentDesc: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.incidentDesc.delegate = self
        
        
        findFields()


    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.firstName:
            self.lastName.becomeFirstResponder()
        case self.lastName:
            self.incidentDesc.becomeFirstResponder()
        default:
            self.incidentDesc.resignFirstResponder()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    func findFields() {
        if UDM.shared.defaults.value(forKey: "firstName") != nil {
            if let value = UDM.shared.defaults.value(forKey: "firstName") as? String {
//                firstName.isHidden = false
                firstName.text = value
            }
        }
        
        if UDM.shared.defaults.value(forKey: "lastName") != nil {
            if let value = UDM.shared.defaults.value(forKey: "lastName") as? String {
//                firstName.isHidden = false
                lastName.text = value
            }
        }
    }
    
    
    
    @IBAction func tipSubmitButtonPressed(_ sender: UIButton) {
        print("Submit button pressed!")
        
        let timeFormat = DateFormatter()
        timeFormat.timeStyle = DateFormatter.Style.long
        timeFormat.dateStyle = DateFormatter.Style.long
        let coordinate = "38.947726, -92.326521"
        
        let tipData = [
            "fname": firstName.text!,
            "lname": lastName.text!,
            "timeAndDate": timeFormat.string(from: incidentTimeAndDate.date),
            "description": incidentDesc.text!,
            "coordinates": coordinate
        ] as [String : Any]
        
        
        UserDefaults.standard.set(self.firstName.text, forKey: "fName")
        let name = UserDefaults.standard.string(forKey: "fName") as String?
        print("User Default Name:\(name)")
        //        SET FIELDS TO EMPTY AFTER SUBMISSION
        
        
        
        
        let db = Firestore.firestore().collection("Tips")
        db.addDocument(data: tipData) { (error) in
            if let error = error {
//                print("Unable to create chat! \(error)")
                return
            } else {
//                print("Item sent")
                self.incidentDesc.text = ""
//                UserDefaults.standard.set(self.firstName, forKey: "fName")
//                let name = UserDefaults.standard.string(forKey: "fName") as String?
//                print("User Default Name:\(name)")
            }
        }
        
    }
    
    
}
