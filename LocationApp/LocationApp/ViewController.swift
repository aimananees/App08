//
//  ViewController.swift
//  LocationApp
//
//  Created by Aiman Abdullah Anees on 27/05/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController , CLLocationManagerDelegate {
    
    let LocationManager = CLLocationManager()
    

    @IBOutlet var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LocationManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Button(sender: UIButton) {
        
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        
        
        let location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegionMake(center, span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "Burj Khalifa"
        annotation.subtitle = "Dubai ,United Arab Emirates"
        MapView.addAnnotation(annotation)
        
        
        
        MapView.setRegion(region, animated: true)
        LocationManager.stopUpdatingLocation()
    }

}

