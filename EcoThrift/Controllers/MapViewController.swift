//
//  MapViewController.swift
//  EcoThrift
//
//  Created by Jonathan Ballona Sanchez on 3/5/22.
//

import UIKit
import MapKit

struct Store{
    var ImgURL: String
    var lat: Double
    var long: Double
    var phone: String
    var name: String
    
    init(url: String, lat:String,long:String,phone:String, name: String){
        self.ImgURL = url
        self.lat    = Double(lat) ?? 37.25
        self.long   = Double(long) ?? -120.35
        self.phone  = phone
        self.name   = name
    }
}

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var annotationView: MKAnnotationView!
    
    //Single shop for now but list of shops pulled from firebase
    var storeA: ThriftStore!
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocation()
        // Do any additional setup after loading the view.
        mapView.delegate = self
    }
    
    func getData(){
        let api = DatabaseWrapper()
        api.getAllStores { key, value in
            let url = "\(value["ImgURL"])"
            let lat = "\(value["lat"])"
            let long = "\(value["long"])"
            let phone = "\(value["phone-number"])"
            
            self.stores.append(Store(url: url, lat: lat, long: long, phone: phone, name: key))
            self.configureLocation()
            self.mapView.reloadInputViews()
            
        }
        
    }
    
    func configureLocation(){
//        let longitude = storeA.coordinates["longitude"] ?? -122.5
//        let latitude = storeA.coordinates["latitude"] ?? 37.8
        let longitude: Double
        let latitude: Double
        
        if (stores.isEmpty) {
            longitude = -122.5
            latitude = 37.5
        } else {
             longitude = stores[0].long ?? -122.5
             latitude = stores[0].lat ?? 37.8
        }
        
        
        let locationCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees.init(latitude), CLLocationDegrees.init(longitude))
        
        let storeRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(storeRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = locationCoordinate
//        print(storeA.name)
        
        if (!stores.isEmpty){
            annotation.title = stores[0].name
        } else {
            annotation.title = "Goodwill"
        }
        
//        annotation.title = "Goodwill"
//        annotation.im
        
        mapView.addAnnotation(annotation)
        //add overlay?
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseID = "myAnnotationView"
        print("mapView protocol called!")
        
        self.annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        
        // 14) performSegue to PostImageVC
        if (annotationView == nil){
            // MARK: USE MKPinAnnotationView and NOT MKAnnotationView
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            annotationView?.canShowCallout = true

            // 9) Add info button to annotation view
            let annotationViewButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            annotationViewButton.setImage(UIImage(named: "camera"), for: .normal)

            annotationView?.leftCalloutAccessoryView = annotationViewButton
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        self.performSegue(withIdentifier: "toSlideCard", sender: nil)
        
        
    }
    
    func imageSelected(controller: InfoCardViewController, image: UIImage) {
        // 9) Add info button to annotation view
        let annotationViewButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        annotationViewButton.setImage(image, for: .normal)
        self.annotationView?.leftCalloutAccessoryView = annotationViewButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! InfoCardViewController
        
        
    }
    

}
