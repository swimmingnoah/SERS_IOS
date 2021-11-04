//
//  TipLineFormViewController.swift
//  SERS
//
//  Created by Ryan Woods on 11/4/21.
//

import UIKit

class TipLineFormViewController: UIViewController {
    
    @IBOutlet weak var textDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textDescription.layer.borderColor = UIColor.lightGray.cgColor
        textDescription.layer.borderWidth = 1
        textDescription.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
