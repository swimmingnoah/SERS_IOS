

//
//  HelpInfoViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/27/21.
//

import UIKit

class HelpInfoViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var info: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = info

        // Do any additional setup after loading the view.
    }
    


}
