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
	@IBOutlet private var MapView: MKMapView!

	let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
//		MapView.delegate = self
//		MapView.dataSource = self
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
//		Location_1
		let Location_1 = MKPointAnnotation()
		Location_1.coordinate = CLLocationCoordinate2D(latitude: 38.92993358763805, longitude: -92.33617601277871)
		Location_1.title = "Mick Deaver Memorail DR"
		Location_1.subtitle = "Next to MU Recreation Trail"

		MapView.addAnnotation(Location_1)
		
//		Location_2
		let Location_2 = MKPointAnnotation()
		Location_2.coordinate = CLLocationCoordinate2D(latitude: 38.929369662729705, longitude: -92.34068659851623)
		Location_2.title = "Research Park Drive"
		Location_2.subtitle = "Next to RP 10"
		
		MapView.addAnnotation(Location_2)
		
		//		Location 3
		let Location_3 = MKPointAnnotation()
		Location_3.coordinate = CLLocationCoordinate2D(latitude: 38.93628097070712, longitude: -92.3405897590391)
		Location_3.title = "Walton Stadium"
		Location_3.subtitle = ""
		
		MapView.addAnnotation(Location_3)
		
		
		//		Location 4
		let Location_4 = MKPointAnnotation()
		Location_4.coordinate = CLLocationCoordinate2D(latitude: 38.93127521421751, longitude: -92.34131352906194)
		Location_4.title = "Reactor Parking Lot"
		Location_4.subtitle = ""
		
		MapView.addAnnotation(Location_4)
		
		
		//		Location 5
		let Location_5 = MKPointAnnotation()
		Location_5.coordinate = CLLocationCoordinate2D(latitude: 38.93167926481028, longitude: -92.34130734557004)
		Location_5.title = "Reactor Building"
		Location_5.subtitle = ""
		
		MapView.addAnnotation(Location_5)
		
		
		
		//		Location 6
		let Location_6 = MKPointAnnotation()
		Location_6.coordinate = CLLocationCoordinate2D(latitude: 38.926732315609115, longitude: -92.34117129630698)
		Location_6.title = "Green Tennis Center"
		Location_6.subtitle = ""
		
		MapView.addAnnotation(Location_6)
		
		
		
		//		Location 7
		let Location_7 = MKPointAnnotation()
		Location_7.coordinate = CLLocationCoordinate2D(latitude: 38.929937385916425, longitude: -92.33220407225704)
		Location_7.title = "1600 Providence Pt"
		Location_7.subtitle = ""
		
		MapView.addAnnotation(Location_7)
	}
	

}
