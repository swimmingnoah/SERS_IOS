//
//  MUPDViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/27/21.
//

import UIKit

class MUPDViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func mupdButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ChatSegue", sender: sender)
    }
    //    @IBAction func redButtonClicked(sender: AnyObject) {
//        self.performSegueWithIdentifier("redView", sender: sender)
//    }
    
}
