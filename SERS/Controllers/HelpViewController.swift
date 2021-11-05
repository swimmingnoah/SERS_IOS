//
//  HelpViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/27/21.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    let helpPages = ["Map Page", "Tip Line Page", "Chat Page", "Profile Page"]

    
    let infoPage = ["The Map Page is a map of all the emergency kiosks on campus, along with pictures of the different types of kiosks. There is also a pin for the Mizzou Police station. The Map Page has a legend the gives additional information to help read the map.", "The Tip Line Page is where you can report incidents of a crime to the Mizzou Police Department.", "The Chat Page is a way to directly contact emergency responders if you need help. This chat is meant only for emergencies, and should be treated like a 9-1-1 call. In order to use the chat function you will need to share your location and profile information details.", "The Profile Page is meant to store your name, phone number, and email. This information will be automatically filled in while reporting a tip or contacting emergency responders. This is to help emergency responders react quickly to emergency situations, but is optional to fill ahead of time."]
    
    
    @IBOutlet weak var helpTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpPages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath)
        cell.textLabel?.text = helpPages[indexPath.row]
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HelpInfoViewController,
        let indexPath = helpTable.indexPathForSelectedRow{

            destination.info = infoPage[indexPath.row]
//            destination.color = colors[indexPath.row]// set to chosen color
//            destination.dataBackround = dataBackround[indexPath.row]//set to chosen color val

            helpTable.deselectRow(at: indexPath, animated: true)
        }
    }

}
