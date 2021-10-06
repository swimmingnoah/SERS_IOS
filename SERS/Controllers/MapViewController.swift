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
		
		let span = MKCoordinateSpan(latitudeDelta: 0.1,
									longitudeDelta: 0.1)
		
		let region = MKCoordinateRegion(center: coordinate,
										span: span)
		MapView.setRegion(region,
						  animated: true)
	}
    
}
