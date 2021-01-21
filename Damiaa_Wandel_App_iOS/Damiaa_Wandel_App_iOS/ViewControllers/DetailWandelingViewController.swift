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
    
    var bestemming: CLLocation?
    var userLoc : CLLocation?
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
        
        prepBestemming(coordinates: wDetails!.bestemming!)
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest // Best consumes a lot of Battery
        manager.requestWhenInUseAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        _titel.text = wDetails!.title
        _afstand.text = wDetails!.afstand! + " km"
        _omschrijving.text = wDetails!.omschrijving
        prepBestemming(coordinates: wDetails!.bestemming!)
        getDirections()
        print("viewWillAppear")
    }
    
    func prepBestemming(coordinates: [Double]){
        
            let regionRadius: CLLocationDistance = 1000.0
            let co = CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
            let region = MKCoordinateRegion(center: co, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
            let pin = MKPointAnnotation()
            pin.coordinate = co
            mapView.addAnnotation(pin)
        
            mapView.setRegion(region, animated: true)
            print(coordinates)
    }
    
    func getDirections(){
        guard let location = manager.location?.coordinate else {
            
            return
        }
        
        let request = createDirectionRequest(from: location)
        let directions = MKDirections(request: request)
        
        directions.calculate{ [unowned self] (response, error) in
            //TODO: Error handling
            guard let response = response else { return } //TODO: show response is not available in an alert
            
            for route in response.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true) //toont de volledige route op de map
            }
        }
    }
    
    func createDirectionRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request{
        
        let destinationCoordinate = CLLocationCoordinate2DMake(wDetails!.bestemming![0], wDetails!.bestemming![1])
        let startingLocation      = MKPlacemark(coordinate: coordinate)
        let destination           = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .walking
        //request.requestsAlternateRoutes = true
        
        return request
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation{
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
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
        
//        How to put a pin on the map
//        let pin = MKPointAnnotation()
//        pin.coordinate = coordinate
//        mapView.addAnnotation(pin)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .red
        
        return renderer
    }
}
