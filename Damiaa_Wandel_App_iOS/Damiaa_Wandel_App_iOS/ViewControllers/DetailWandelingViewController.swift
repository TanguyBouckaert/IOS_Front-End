//
//  DetailViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 26/12/2020.
//

import UIKit
import MapKit
import CoreLocation

class DetailWandelingViewController: UIViewController {
    
    @IBOutlet var _titel : UILabel! = UILabel()
    @IBOutlet var _afstand : UILabel! = UILabel()
    @IBOutlet var _omschrijving : UILabel! = UILabel()
    
    @IBOutlet weak var mapView: MKMapView!
    var bestemming: Locatie?
    var wDetails : Wandeling?
    let manager = CLLocationManager()
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            mapView.mapType = .hybrid
        } else {
            mapView.mapType = .standard
        }
    }
    
    @IBAction func findMyLocation(_ sender: UIButton) {
        
        manager.startUpdatingLocation()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bestemming = bestemming {
            let regionRadius: CLLocationDistance = 1000.0
            let region = MKCoordinateRegion(center: bestemming.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
            mapView.setRegion(region, animated: true)
        }
        
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest // Best consumes a lot of Battery
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        _titel.text = wDetails!.title
        _afstand.text = wDetails!.afstand! + " km"
        _omschrijving.text = wDetails!.omschrijving
        print("viewWillAppear")
    }
    
}

extension DetailWandelingViewController: MKMapViewDelegate, CLLocationManagerDelegate{
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering ...")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region , animated: true)
        
        //How to put a pin on the map
//        let pin = MKPointAnnotation()
//        pin.coordinate = coordinate
//        mapView.addAnnotation(pin)
    }
}
