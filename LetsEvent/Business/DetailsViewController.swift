//
//  DetailsViewController.swift
//  LetsEvent
//
//  Created by Renaud Marzana on 02/10/2018.
//  Copyright © 2018 Renaud Marzana. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    // event and user variables
    var currentEvent: Event?
    var currentUser: User?
    
    // variables about the mapView
    let position = CLLocationManager()
    var region = MKCoordinateRegion()
    var localisation = CLLocationCoordinate2D()
    var latitude = String ()
    var longitude = String ()
    var altitude = String ()
    // gps side
    var nomGps = String ()
    var latPoint = String ()
    var longPoint = String ()
    var pointGps = MKPointAnnotation()
    
    // view variables
    @IBOutlet weak var mapEvent: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categorieLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var heureLabel: UILabel!
    @IBOutlet weak var tarifsLabel: UILabel!
    @IBOutlet weak var placesLabel: UILabel!
    
    @IBAction func centerMapPressed(_ sender: UIButton) {
        self.mapEvent.setRegion(region, animated: true)
    }
    
    
    @IBAction func bookButtonPressed(_ sender: Any) {
        if (currentUser == nil){
            // utilisateur non existant , rediriger vers login et inscription
            performSegue(withIdentifier: "showLogin", sender: nil)
        }
    }
    
    @IBAction func unwindToDetails(segue:UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
     /*   let latgps = (latPoint as NSString).doubleValue
        
        let longgps = (longPoint as NSString).doubleValue
        let gps:CLLocationCoordinate2D = CLLocationCoordinate2D (latitude: latgps, longitude: longgps)
     */
        
    /*    if affiche == true {
            MapView.addAnnotation(pointgps)
            
            let spangps:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
            let regiongps:MKCoordinateRegion = MKCoordinateRegionMake(gps, spangps)
            self.MapView.setRegion(regiongps, animated: true)
            
            let sourceplace = MKPlacemark (coordinate: localisation, addressDictionary: nil)
            let destsourceplace = MKPlacemark (coordinate: gps, addressDictionary: nil)
            let Sourcemap = MKMapItem(placemark: sourceplace)
            let destmapitem = MKMapItem (placemark: destsourceplace)
            let direRequest = MKDirectionsRequest()
            
            direRequest.source = Sourcemap
            direRequest.destination = destmapitem
            direRequest.transportType = .walking
            let dire = MKDirections(request: direRequest)
            
            dire.calculate {
                (response, error) -> Void in
                guard let response = response else {
                    if let error = error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                let route = response.routes[0]
                self.MapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
                let rect = route.polyline.boundingMapRect
                self.MapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            }
        }*/
        
        initDetails()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setCurrentLocation()
    }
    
    func initDetails(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.timeZone = TimeZone(identifier: "CET")
        let tarifs = currentEvent!.tarifs
        nameLabel.text = currentEvent!.nom
        categorieLabel.text = "<\(String(describing: currentEvent!.categorie))>"
        descriptionTextView.text = currentEvent!.description
        dateLabel.text = "Date : \(dateFormatter.string(from: (currentEvent!.date)))"
        heureLabel.text = "Heure : \(timeFormatter.string(from: (currentEvent!.date)))"
        tarifsLabel.text = "Prix : \(tarifs[0]) € enfant  \(tarifs[1]) € adultes"
        placesLabel.text = "Places : \(String(describing: currentEvent!.places)) capacité maximale"
    }
    
    func setCurrentLocation(){
        position.delegate = self
        position.desiredAccuracy = kCLLocationAccuracyBest
        position.requestWhenInUseAuthorization()
        position.startUpdatingLocation()
    }
    
    // permet de tracer la route depuis sa position vers celle sauvegardee
 /*   func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
   */
    //Permet d'afficher la position
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        let myPosition:CLLocationCoordinate2D = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude )
        region = MKCoordinateRegion(center: myPosition,span: MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1))
        mapEvent.setRegion(region, animated: true)
        
        print("latitude :",userLocation.coordinate.latitude)
        print("longitude :",userLocation.coordinate.longitude)
        print("altitude : ",userLocation.altitude)
        
        pointGps.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        
        pointGps.title = "You are here"
        mapEvent.addAnnotation(pointGps)
    }
    
    //Permet de bloquer la rotation de l'ecran
    open override var shouldAutorotate: Bool {
        get{
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
