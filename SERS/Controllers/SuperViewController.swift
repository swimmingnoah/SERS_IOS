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
/*
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Backdrop")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        */
        //self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.black
        //self.navigationController?.tabBarController?.tabBar.tintColor = UIColor(displayP3Red: 188, green: 56, blue: 31, alpha: 1)
        self.navigationController?.tabBarController?.tabBar.tintColor = UIColor.white
        self.navigationController?.tabBarController?.tabBar.barTintColor = UIColor.systemGray4
        //self.navigationController?.tabBarItem.badgeColor = UIColor.red
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
