//
//  SuperViewController.swift
//  SERS
//
//  Created by Drake Ewing on 11/12/21.
//

import UIKit

class SuperViewController: UIViewController {

    //let apperance = UITabBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //tabBar.standardAppearance = apperance
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
        //self.navigationController?.tabBarController?.
        //self.navigationController?.tabBarItem.standardAppearance?.selectionIndicatorTintColor = UIColor.black
        self.navigationController?.tabBarController?.tabBar.unselectedItemTintColor = UIColor.black
        //self.navigationController?.tabBarController?.tabBarItem.standardAppearance?.selectionIndicatorTintColor = UIColor.black
        
        // Do any additional setup after loading the view.
    }
    
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance){
        itemAppearance.normal.iconColor = UIColor.black
    }

}
