

//
//  HelpInfoViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/27/21.
//

import UIKit

class HelpInfoViewController: SuperViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var info: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = info

        //view.backgroundColor = UIColor(red: 189/250, green: 168/250, blue: 145/250, alpha: 1)
        // Do any additional setup after loading the view.
    }
    


}
