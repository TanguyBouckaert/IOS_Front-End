//
//  AddWandelingViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 16/12/2020.
//

import UIKit
import CoreData
import MapKit


class AddWandelingViewController: UIViewController {
    
    @IBOutlet weak var input_title : UITextField!
    @IBOutlet weak var input_afstand : UITextField!
    @IBOutlet weak var input_omschrijving: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    
    let manager = CLLocationManager()
    var alert : UIAlertController!
    var homeScreen: HomeScreenViewController! //Maakt een object van de homescreencontroller
    var input_bestemming : MKAnnotation!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //Do any additional setup after loading the view
        homeScreen = HomeScreenViewController()
        mapView.delegate = self
        
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        mapView.addGestureRecognizer(longTapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest // Best consumes a lot of Battery
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
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
    
    @IBAction func addWandeling(_ sender: Any) {
        
        //Toont eerst een alert voor een wandeling wordt toegevoegd
        self.alert = UIAlertController(title: self.input_title.text, message: self.input_omschrijving.text, preferredStyle: .alert)
        let okeAction = UIAlertAction(title: "OK", style: .default){
            UIAlertAction in
            
            //Get the textfield
            let title = self.input_title.text
            let bestemming = self.input_bestemming.coordinate
            let afstand = self.input_afstand.text
            let omschrijving = self.input_omschrijving.text
            
            //Create a Wandeling object
            let newWandeling = Wandeling(context: self.context)
            newWandeling.title = title
            newWandeling.bestemming = [bestemming.latitude, bestemming.longitude]
            newWandeling.afstand = afstand
            newWandeling.omschrijving = omschrijving
            
            //Save the data
            do {
                try self.context.save()
            } catch {
                print("An error occurred while saving the newWandeling!!!")
            }
            
        }
        self.alert.addAction(okeAction)// Moet naar een detail pagina gaan!!
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
            print("doe niets")
        }
        self.alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func longTap(sender: UIGestureRecognizer){
        
        print("long tap")
        if sender.state == .began {
                let locationInView = sender.location(in: mapView)
                let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
                addAnnotation(location: locationOnMap)
            }
    }
    
    func addAnnotation(location: CLLocationCoordinate2D){
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Bestemming"
            annotation.subtitle = "Hier komt uw bestemming"
            self.input_bestemming = annotation
            self.mapView.addAnnotation(annotation)
    }
    
}

extension AddWandelingViewController: MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate{
    
    //SOURCE <https://stackoverflow.com/questions/34431459/ios-swift-how-to-add-pinpoint-to-map-on-touch-and-get-detailed-address-of-th>
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView!.canShowCallout = true
                pinView!.rightCalloutAccessoryView = UIButton(type: .infoDark)
                pinView!.pinTintColor = UIColor.black
            }
            else {
                pinView!.annotation = annotation
            }
            return pinView
        
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
        
    }
}
