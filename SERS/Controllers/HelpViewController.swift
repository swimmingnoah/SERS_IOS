//
//  HelpViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/27/21.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    let helpPages = ["Map Page", "Tip Line Page", "Chat Page", "Profile Page"]

    
    let infoPage = [
        //Map Help Page information
        "Help for the Map Page! \n\n\nPlease read below for help with the Map Page. \n\nThe Map Page is a map of all the emergency kiosks on campus, along with pictures of the different types of kiosks. There is also location information for the Mizzou Police station. \n\nAs you zoom in and out of the campus area you will see the different colored pins around campus. The color for these pins cordinates with the color of the emergency tower or box located at that position, meaning a blue pin indicates a blue colored help station tower or box visible at the pin's location. This is the case for all of the different colored pins, but the pin for the MUPD station locationed in the Virginia Parking structure, 901 Virginia Ave., and is a red pin. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201.",
        // Pin color is still being detemined, subject to change
        
        // Images would probs be added here with text but also could have their own coordinating let
        
        // May not have a map legend
        /*The Map Page has a legend the gives additional information to help read the map, giving all of the color and icon meanings.*/
        
        //Tip Line help page info
        "elp for the Tip Line Page! \n\n\nPlease read below for help with the Tip Line Page. \n\nThe Tip Line Page is where you can report incidents of a crime to the Mizzou Police Department. Here you can also submit any information about an incident you may have seen or have any information about that could help the Univeristy of Missouri Police Department. \n\n The Tip Line asks for your name and a description of the incident, your name will be autofilled if you have provided the optional profile data, located on the Profile page, prior to opening and filling out the Tip Line form. \n\nThe Tip Line Page should not be used for immediate emergencies, if you are in need of help right away please use our Chat Page to get in contact with an emergency responder of MUPD or call 9-1-1. It is asked that SERS users please submit only honest tips, all Tip Line form submissions will be investigated thoroughly. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201.",
        //should be good to go with no more changes - 11/7
        
        //Chat help page info
        "Help for the Chat Page! \n\n\nPlease read below for help with the Chat Page. \n\nThe Chat Page is a way to directly contact emergency responders if you need immediate help. This chat is meant only for emergencies, and should be treated like a 9-1-1 call. For any nonemergency incident we ask that SERS users call the MUPD nonemergency number (573) 882-7201, or please fill out a Tip Line form on the Tip Line Page. \n\nIn order to use the chat function you will need to share your location and profile information details in the app, all of this information requested is being used to help get you helpnas fast as possible. To allow the app to have your location data you will need to add this permission in your iOS device settings. Please consider filling out the profile information, on the Profile Page, when you first download the SERS application to be able to get help as fast as possible. \n\nThe Chat Page is to contact a emergency responder for any type of emergency. Please be responsible in the use of the Chat Page, any and all incidents of misuse will be investigated. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201.",
        //May need to edit functionality statements because it is subject to change with still having to connect the database
        
        //Profile help page info
        "Help for the Profile Page! \n\n\nPlease read below for help with the Profile Page. \n\nThe Profile Page is meant to store your name, phone number, and email for use in the rest of the SERS application, like using the Tip Line or Chat functionalities. SERS users do not have to provide this information if they do not want to, but it is recommended to provide this information to use parts of the application and to get help as fast as possible. \n\nAll of the profile information will be automatically filled in while reporting a tip or contacting emergency responders. This action is to help emergency responders react quickly to emergency situations, but is optional and you have the choice to not provide any of this inforamtion. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201."]
    //Should be good to go with no more changes - 11/7
    //may have to change functionality statements if plans change from here on out
    
    
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
