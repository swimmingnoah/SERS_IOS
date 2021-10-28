//
//  MapViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/4/21.
//

import UIKit
import RealmSwift
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var MapView: MKMapView!

    let manager = CLLocationManager()
    
    
    let pins = [["id":1, "name": "Mick Deaver Memorial DR", "Lat":38.929933587638, "Long":-92.3361760127787, "info": "Next to MU Recreation Trail" ],
                ["id":2, "name": "Research Park Drive", "Lat":38.9293696627297, "Long":-92.3406865985162, "info": "Next to RP 10" ],
    ["id":3, "name": "Walton Stadium", "Lat":38.9362809707071, "Long":-92.3405897590391, "info": "Behind Walton Stadium Track & Feild" ],
    ["id":4, "name": "Reactor Parking Lot", "Lat":38.9312752142175, "Long":-92.3413135290619, "info": "" ],
    ["id":5, "name": "Reactor Building", "Lat":38.9316792648102, "Long":-92.34130734557, "info": "" ],
    ["id":6, "name": "Green Tennis Center", "Lat":38.9267323156091, "Long":-92.3411712963069, "info": "" ],
    ["id":7, "name": "1600 Providence Pt", "Lat":38.9299373859164, "Long":-92.332204072257, "info": "" ],
    ["id":8, "name": "Marching Mizzou Practice Lot", "Lat":38.9315050897498, "Long":-92.3276030506494, "info": "" ],
    ["id":9, "name": "SG-4 Lot 1", "Lat":38.9327898063769, "Long":-92.3308229880488, "info": "" ],
    ["id":10, "name": "SG-4 Lot 2", "Lat":38.9325623238223, "Long":-92.3297867429294, "info": "" ],
    ["id":11, "name": "General Services Building", "Lat":38.9337112173736, "Long":-92.3277181048505, "info": "By softball field" ],
    ["id":12, "name": "General Services Building 2", "Lat":38.9344724790888, "Long":-92.3276801726898, "info": "By softball field" ],
    ["id":13, "name": "Tiger Pantry", "Lat":38.9334647512964, "Long":-92.3219732563348, "info": "" ],
    ["id":14, "name": "Bridge over Providence", "Lat":38.9366265060681, "Long":-92.3349184598001, "info": "By Stadium" ],
    ["id":15, "name": "Front of Stadium", "Lat":38.937061641812, "Long":-92.332451809211, "info": "" ],
    ["id":16, "name": "Side of Stadium", "Lat":38.9357268149039, "Long":-92.3314885192278, "info": "" ],
    ["id":17, "name": "Hospital Garage Parking Lot", "Lat":38.9361415582095, "Long":-92.3233069300935, "info": "outside of VAG" ],
    ["id":18, "name": "Hospital Garage 1", "Lat":38.9365385330567, "Long":-92.324742295897, "info": "inside of VAG" ],
    ["id":19, "name": "Outside Hospital Garage", "Lat":38.9364789869713, "Long":-92.3252717863933, "info": "" ],
    ["id":20, "name": "Hospital Garage 2", "Lat":38.9365732682501, "Long":-92.3255397213433, "info": "" ],
    ["id":21, "name": "Hospital Garage 3", "Lat":38.9373870159545, "Long":-92.3259111042995, "info": "" ],
    ["id":22, "name": "Hospital Garage 4", "Lat":38.9373808000922, "Long":-92.3243687926107, "info": "" ],
    ["id":23, "name": "South Residence Hall", "Lat":38.9384254062361, "Long":-92.333503166291, "info": "" ],
    ["id":24, "name": "Center Residence Hall", "Lat":38.9390901759481, "Long":-92.3334683044771, "info": "" ],
    ["id":25, "name": "South Hall Parking", "Lat":38.9382416157365, "Long":-92.3326781694832, "info": "" ],
    ["id":26, "name": "Bluford Residence Hall", "Lat":38.9390340215461, "Long":-92.3324495517194, "info": "" ],
    ["id":27, "name": "Laws Residence Hall", "Lat":38.9387875655718, "Long":-92.3308492275, "info": "" ],
    ["id":28, "name": "Brooks Residence Hall", "Lat":38.938459996178, "Long":-92.3315551349057, "info": "" ],
    ["id":29, "name": "Tiger Ave Garage 1", "Lat":38.9378298107922, "Long":-92.3305363820365, "info": "" ],
    ["id":30, "name": "Tiger Ave Garage 2", "Lat":38.9386222211995, "Long":-92.3303960027229, "info": "" ],
    ["id":31, "name": "Tiger Ave Garage 3", "Lat":38.9384381581543, "Long":-92.3298104204432, "info": "" ],
    ["id":32, "name": "Tiger Ave Garage 4", "Lat":38.9391837665206, "Long":-92.3302957317846, "info": "" ],
    ["id":33, "name": "Tiger Ave Garage 5", "Lat":38.9393303915112, "Long":-92.3297783337429, "info": "" ],
    ["id":34, "name": "Outside Dogwood", "Lat":38.9398274280327, "Long":-92.3274532484636, "info": "" ],
    ["id":35, "name": "Hitt Street Market", "Lat":38.9397097695413, "Long":-92.3263285925939, "info": "" ],
    ["id":36, "name": "Hitt Street Outside Hospital", "Lat":38.9389485576923, "Long":-92.3257681975206, "info": "" ],
    ["id":37, "name": "Defoe Graham 1", "Lat":38.9400970247416, "Long":-92.3260253549835, "info": "" ],
    ["id":38, "name": "Defoe Graham 2", "Lat":38.9402254489693, "Long":-92.3262349196323, "info": "" ],
    ["id":39, "name": "Hawthorne Residence Hall", "Lat":38.9405366297874, "Long":-92.3263555780664, "info": "" ],
    ["id":40, "name": "HawLeWood", "Lat":38.9405860234425, "Long":-92.3275240597443, "info": "end of curvy path" ],
    ["id":41, "name": "VAG 1", "Lat":38.9398846303203, "Long":-92.3251680449916, "info": "" ],
    ["id":42, "name": "VAG 2", "Lat":38.9398994485567, "Long":-92.3243361368405, "info": "" ],
    ["id":43, "name": "VAG 3", "Lat":38.9404872361024, "Long":-92.3243361368405, "info": "" ],
    ["id":44, "name": "VAG 4", "Lat":38.9405168723202, "Long":-92.3250981901087, "info": "" ],
    ["id":45, "name": "Delta Gamma", "Lat":38.94153437499, "Long":-92.3330171943202, "info": "" ],
    ["id":46, "name": "Richmond Ave", "Lat":38.9414207710438, "Long":-92.3312835230542, "info": "" ],
    ["id":47, "name": "Stankowski Field", "Lat":38.9415993225188, "Long":-92.3300442393253, "info": "" ],
    ["id":48, "name": "Rec Center", "Lat":38.9415630284994, "Long":-92.3275910896826, "info": "" ],
    ["id":49, "name": "Johnston Residence Hall", "Lat":38.9419674464941, "Long":-92.3250446138885, "info": "" ],
    ["id":50, "name": "Wolpers Residence Hall", "Lat":38.9415733982193, "Long":-92.3251979357204, "info": "" ],
    ["id":51, "name": "Rollins", "Lat":38.9418119013851, "Long":-92.3232847457808, "info": "" ],
    ["id":52, "name": "Plaza 900", "Lat":38.9408114915949, "Long":-92.3232986607317, "info": "" ],
    ["id":53, "name": "Excellence Residence Hall", "Lat":38.9399726747729, "Long":-92.32282387242, "info": "" ],
    ["id":54, "name": "Discovery Residence Hall", "Lat":38.9398618869064, "Long":-92.3226475225162, "info": "" ],
    ["id":55, "name": "Path Between Dorms", "Lat":38.9393079449769, "Long":-92.3230409184556, "info": "" ],
    ["id":56, "name": "Gateway Residence Hall", "Lat":38.9387328959198, "Long":-92.3227696109112, "info": "" ],
    ["id":57, "name": "Telecommunications Building 1", "Lat":38.9392880514592, "Long":-92.3216740342751, "info": "" ],
    ["id":58, "name": "Telecommunications Building 2", "Lat":38.9390644886193, "Long":-92.3212948783165, "info": "" ],
    ["id":59, "name": "College Ave Residence Hall 1", "Lat":38.9411660337324, "Long":-92.3211843272053, "info": "" ],
    ["id":60, "name": "College Ave Residence Hall 2", "Lat":38.9409524165811, "Long":-92.3211606508909, "info": "" ],
    ["id":61, "name": "Hatch Residence Hall", "Lat":38.9408050651067, "Long":-92.3198314160369, "info": "" ],
    ["id":62, "name": "AV-12", "Lat":38.9418617187408, "Long":-92.3189640853061, "info": "" ],
    ["id":63, "name": "AV-9", "Lat":38.9411284616738, "Long":-92.3157987425755, "info": "" ],
    ["id":64, "name": "Animal Research Center", "Lat":38.938431573586, "Long":-92.3175303123891, "info": "" ],
    ["id":65, "name": "Trowbridge Livestock Center", "Lat":38.9373467486225, "Long":-92.3183946244062, "info": "" ],
    ["id":66, "name": "AV-14 1", "Lat":38.9370529016758, "Long":-92.3164562816001, "info": "" ],
    ["id":67, "name": "AV-14 2", "Lat":38.9360161820479, "Long":-92.3164943620029, "info": "" ],
    ["id":68, "name": "Tara Student Apartments", "Lat":38.9348609622874, "Long":-92.3174844525258, "info": "" ],
    ["id":69, "name": "University Village 1", "Lat":38.9432850060848, "Long":-92.3347939098335, "info": "" ],
    ["id":70, "name": "University Village 2", "Lat":38.9439131054827, "Long":-92.3359530095742, "info": "" ],
    ["id":71, "name": "Mark Twain 1", "Lat":38.9454993366845, "Long":-92.3326833281441, "info": "" ],
    ["id":72, "name": "Mark Twain 2", "Lat":38.945191877843, "Long":-92.3322565618167, "info": "" ],
    ["id":73, "name": "Conley Ave Garage 1", "Lat":38.9448040585388, "Long":-92.331924133309, "info": "" ],
    ["id":74, "name": "Conley Ave Garage 2", "Lat":38.9447900830288, "Long":-92.3312233380766, "info": "" ],
    ["id":75, "name": "Conley Ave Garage 3", "Lat":38.9454853613116, "Long":-92.3312233380766, "info": "" ],
    ["id":76, "name": "TAPS Garage 1", "Lat":38.9439828503876, "Long":-92.3310099598108, "info": "" ],
    ["id":77, "name": "TAPS Garage 2", "Lat":38.9441330886866, "Long":-92.3308033150628, "info": "" ],
    ["id":78, "name": "Conley Ave", "Lat":38.9443182656869, "Long":-92.3308751914968, "info": "Outside TAPS" ],
    ["id":79, "name": "TAPS Garage 3", "Lat":38.9437487575197, "Long":-92.3315849712835, "info": "" ],
    ["id":80, "name": "TAPS Garage 4", "Lat":38.9436264698933, "Long":-92.3308662069426, "info": "" ],
    ["id":81, "name": "TAPS Garage 5", "Lat":38.943556591155, "Long":-92.3301384580474, "info": "" ],
    ["id":82, "name": "TAPS Garage 6", "Lat":38.9439688747157, "Long":-92.3300441202277, "info": "" ],
    ["id":83, "name": "Townsend Hall", "Lat":38.9453019638903, "Long":-92.3303580148053, "info": "" ],
    ["id":84, "name": "Carnahan Quadrangle", "Lat":38.9431340806167, "Long":-92.3284869037462, "info": "" ],
    ["id":85, "name": "Kulhman Court", "Lat":38.9433487254789, "Long":-92.3261576740629, "info": "" ],
    ["id":86, "name": "Speakers Circle", "Lat":38.9445077965105, "Long":-92.3274161203843, "info": "" ],
    ["id":87, "name": "Gentry Hall", "Lat":38.9445337476614, "Long":-92.3255563865844, "info": "" ],
    ["id":88, "name": "Life Sciences Center", "Lat":38.9433219088631, "Long":-92.3238016841259, "info": "" ],
    ["id":89, "name": "Chemistry Department 1", "Lat":38.9439632157398, "Long":-92.3233080382712, "info": "" ],
    ["id":90, "name": "Chemistry Department 2", "Lat":38.9440391595911, "Long":-92.3223804180387, "info": "" ],
    ["id":91, "name": "Schlundt Hall", "Lat":38.9449715747172, "Long":-92.3234165318148, "info": "" ],
    ["id":92, "name": "Student Success Center", "Lat":38.9457667659321, "Long":-92.3263736545491, "info": "" ],
    ["id":93, "name": "University Ave Garage 1", "Lat":38.9465750598833, "Long":-92.3242445831799, "info": "" ],
    ["id":94, "name": "University Ave Garage 2", "Lat":38.9465783323096, "Long":-92.3235587361625, "info": "" ],
    ["id":95, "name": "University Ave Garage 3", "Lat":38.9472164525626, "Long":-92.3235250749592, "info": "" ],
    ["id":96, "name": "University Ave Garage 4", "Lat":38.9472360869409, "Long":-92.3242319602286, "info": "" ],
    ["id":97, "name": "Manor House", "Lat":38.9480345470642, "Long":-92.3251323974627, "info": "" ],
    ["id":98, "name": "Circle at the Quad", "Lat":38.9472413609692, "Long":-92.3285351704646, "info": "" ],
    ["id":99, "name": "Peace Park and Elm", "Lat":38.9485073427077, "Long":-92.3298953145182, "info": "" ],
    ["id":100, "name": "McDavid Hall", "Lat":38.9479021917381, "Long":-92.3314110815698, "info": "" ],
    ["id":101, "name": "Locust Street Building", "Lat":38.9495941809146, "Long":-92.3301038492974, "info": "" ],
    ["id":102, "name": "Hitt Street Garage 1", "Lat":38.9482126422756, "Long":-92.3265101881537, "info": "" ],
    ["id":103, "name": "Hitt Street Garage 2", "Lat":38.9477260454836, "Long":-92.3265209139797, "info": "" ],
    ["id":104, "name": "Hitt Street Garage 3", "Lat":38.9470614878973, "Long":-92.3265030376031, "info": "" ],
    ["id":105, "name": "Hitt Street Garage 4", "Lat":38.9470670490746, "Long":-92.325784407261, "info": "" ]]
    override func viewDidLoad() {
        super.viewDidLoad()
//        MapView.delegate = self
//        MapView.dataSource = self
        self.MapView.showsUserLocation = true
        



    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()

            render(location)
        }
    }
    func render(_ location: CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)

        let span = MKCoordinateSpan(latitudeDelta: 0.03,
                                    longitudeDelta: 0.03)

        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        MapView.setRegion(region,
                          animated: true)
//        createAnotations(locations: pins)
        for pin in pins {
            let annotations = MKPointAnnotation()
            annotations.title = pin["name"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: pin["Lat"] as! CLLocationDegrees,
                                                            longitude: pin["Long"] as! CLLocationDegrees)
            annotations.subtitle = pin["info"] as? String
            MapView.addAnnotation(annotations)
            }


        }
}



//        let Location_1 = MKPointAnnotation()
//        Location_1.coordinate = CLLocationCoordinate2D(latitude: 38.92993358763805, longitude: -92.33617601277871)
//        Location_1.title = "Mick Deaver Memorail DR"
//        Location_1.subtitle = "Next to MU Recreation Trail"
//        MapView.addAnnotation(Location_1)
