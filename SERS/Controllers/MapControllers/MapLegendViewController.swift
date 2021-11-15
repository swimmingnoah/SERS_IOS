//
//  MapLegendViewController.swift
//  SERS
//
//  Created by Drake Ewing on 11/8/21.
//

import UIKit

class MapLegendViewController: SuperViewController{

    @IBOutlet weak var towerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBlue
        //title = "Map Legend"
        /*UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Backdrop")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)*/
        //view.backgroundColor = .systemGray
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
