//
//  MapViewController.swift
//  EcoThrift
//
//  Created by Jonathan Ballona Sanchez on 3/5/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var annotationView: MKAnnotationView!
    
    //Single shop for now but list of shops pulled from firebase
    var storeA: ThriftStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocation()
        // Do any additional setup after loading the view.
        mapView.delegate = self
    }
    
    func configureLocation(){
//        let longitude = storeA.coordinates["longitude"] ?? -122.5
//        let latitude = storeA.coordinates["latitude"] ?? 37.8
        let longitude = -122.5
        let latitude = 37.8
        
        let locationCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees.init(latitude), CLLocationDegrees.init(longitude))
        
        let storeRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude, longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(storeRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = locationCoordinate
//        print(storeA.name)
     
//        annotation.title = storeA.name
        annotation.title = "Goodwill"
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
