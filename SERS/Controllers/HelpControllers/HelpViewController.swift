//
//  HelpViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/27/21.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let helpPages = ["Map", "Tip Line", "Chat", "Profile"]
    let pageLogo = [UIImage(systemName: "location")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), UIImage(systemName: "folder")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), UIImage(systemName: "message")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), UIImage(systemName: "person")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)]

    
    let infoPage = [//Map Help Page information
        "Help for the Map! \n\nThe Map is a map of all the emergency kiosks on campus, to activate these kiosks push the button and a loud noise will be triggered. There is also location information for the Mizzou Police station. \n\nAs you zoom in and out of the campus area you will see the different colored pins around campus. The color for these pins indicate location and the type of tower. A red pin with a tower icon indicates the blue tower kiosks at those locations, and yellow pins with a box icon indicate the emergency kiosks that are smaller yellow boxes found on buildings. The pin for the MUPD station located in the Virginia Parking structure, 901 Virginia Ave., and is a blue pin with a siren icon. In the top left you will see a page icon that you can click to look at the map legend for help with the pins/icons. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201.",
        // Pin color is still being determined, subject to change
                
        /*The Map Page has a legend the gives additional information to help read the map, giving all of the color and icon meanings.*/
        
        //Tip Line help page info
        "Help for the Tip Line! \n\nThe Tip Line is where you can report incidents of a crime to the Mizzou Police Department. Here you can also submit any information about an incident you may have seen or have any information about that could help the University of Missouri Police Department. \n\n The Tip Line asks for your name and a description of the incident, your name will be autofilled if you have provided the optional profile data, located on the Profile, prior to opening and filling out the Tip Line form. \n\nThe Tip Line should not be used for immediate emergencies, if you are in need of help right away please use our Chat to get in contact with an emergency responder of MUPD or call 9-1-1. It is asked that SERS users please submit only honest tips, all Tip Line form submissions will be investigated thoroughly. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201.",
        
        //Chat help page info
        "Help for the Chat! \n\nThe Chat is a way to directly contact emergency responders if you need immediate help. This chat is meant only for emergencies, and should be treated like a 9-1-1 call. For any nonemergency incident we ask that SERS users call the MUPD nonemergency number (573) 882-7201, or please fill out a Tip Line form on the Tip Line. \n\nIn order to use the chat function you will need to share your location and profile information details in the app, all of this information requested is being used to help get you help as fast as possible. To allow the app to have your location data you will need to add this permission in your iOS device settings apps. Please consider filling out the profile information, on the Profile , when you first download the SERS application to be able to get help as fast as possible. \n\nThe Chat is to contact a emergency responder for any type of emergency. Please be responsible in the use of the Chat , any and all incidents of misuse will be investigated. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201.",
        //May need to edit functionality statements because it is subject to change with still having to connect the database
        
        //Profile help page info
        "Help for the Profile! \n\nThe Profile is meant to store your name, phone number, and email for use in the rest of the SERS application, like using the Tip Line or Chat functionalities. SERS users do not have to provide this information if they do not want to, but it is recommended to provide this information to use parts of the application and to get help as fast as possible. \n\nAll of the profile information will be automatically filled in while reporting a tip or contacting emergency responders. This action is to help emergency responders react quickly to emergency situations, but is optional and you have the choice to not provide any of this information. \n\nFor more help please call the nonemergency phone number for MUPD to get support, (573) 882-7201."]
    
    
    @IBOutlet weak var helpTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor(red: 227/250, green: 218/250, blue: 201/250, alpha: 1)
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
        cell.imageView?.image = pageLogo[indexPath.row]
        if (indexPath.row % 2 == 0)
         {
             cell.backgroundColor = UIColor(named: "navBlue")
         } else {
             cell.backgroundColor = UIColor(named: "mainBlue")
         }
        
        
        
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
