//
//  TipViewController.swift
//  SERS
//
//  Created by Kyle Rohlfing on 11/11/21.
//

import UIKit
import Firebase

class TipViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var incidentTimeAndDate: UIDatePicker!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var incidentDesc: UITextField!
    
    @IBAction func tipSubmitButtonPressed(_ sender: UIButton) {
        print("Submit button pressed!")
        
        let timeFormat = DateFormatter()
        timeFormat.timeStyle = DateFormatter.Style.long
        timeFormat.dateStyle = DateFormatter.Style.long
        
        let tipData = [
            "fname": firstName.text!,
            "lname": lastName.text!,
            "timeAndDate": timeFormat.string(from: incidentTimeAndDate.date),
            "description": incidentDesc.text!
        ] as [String : Any]
        
        print(tipData)
        
//        SET FIELDS TO EMPTY AFTER SUBMISSION
        
        firstName.text = ""
        lastName.text = ""
        incidentDesc.text = ""
    }
    

}
