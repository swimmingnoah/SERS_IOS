//
//  TipViewController.swift
//  SERS
//
//  Created by Kyle Rohlfing on 11/11/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import CoreLocation

class TipViewController: SuperViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var incidentTimeAndDate: UIDatePicker!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var incidentDesc: UITextField!
    let locationManager = CLLocationManager()
    
    var long: String = ""
    var lat: String = ""
    
    var usrEmail: String = UDM.shared.defaults.value(forKey: "emailAddr") as! String
    var phoneNum: String = UDM.shared.defaults.value(forKey: "phoneNumber") as! String
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.incidentDesc.delegate = self
        
        
        findFields()


        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        coordinate = "\(locValue.latitude), \(locValue.longitude)"
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
        long = "\(locValue.latitude)"
        lat = "\(locValue.longitude)"
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
        
//        let timeFormat = DateFormatter()
//        timeFormat.timeStyle = DateFormatter.Style.long
//        timeFormat.dateStyle = DateFormatter.Style.long
        let timeInterval = NSDate().timeIntervalSince1970
        
        let tipData = [
            "fname": firstName.text!,
            "lname": lastName.text!,
            "timeAndDate": timeInterval,
            "description": incidentDesc.text!,
            "long": long,
            "lat": lat,
            "email": self.usrEmail,
            "phoneNum": self.phoneNum
        ] as [String : Any]
        
        
        UserDefaults.standard.set(self.firstName.text, forKey: "fName")
        let name = UserDefaults.standard.string(forKey: "fName") as String?
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
