//
//  SuperViewController.swift
//  SERS
//
//  Created by Drake Ewing on 11/12/21.
//

import UIKit

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Backdrop")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        */
        //self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.tabBarController?.tabBar.tintColor = UIColor.white
        self.navigationController?.tabBarController?.tabBar.barTintColor = UIColor.black
        self.navigationController?.tabBarItem.badgeColor = UIColor.white
        
        
        
        // Do any additional setup after loading the view.
    }

}
