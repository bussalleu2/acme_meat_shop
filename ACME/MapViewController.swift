//
//  SecondViewController.swift
//  ACME
//
//  Created by Alba on 4/2/17.
//  Copyright © 2017 bussalleu. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class MapViewController: UIViewController {
    
    var placesClient: GMSPlacesClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("appName", comment: "")
        placesClient = GMSPlacesClient()
        let camera = GMSCameraPosition.camera(withLatitude: 41.385813,
                                              longitude: 2.166508, zoom: 15)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        addMarks(mapView: mapView)
        
    }
    
    func addMarks(mapView: GMSMapView)
    {
        let rc = RestConnections()
        rc.getPlaces { (placesList, error) in  if let _ = error {
            // TODO: Error
        } else {
            
            for place in placesList!
            {
                DispatchQueue.main.async {
                    () -> Void in
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2DMake(place.latitude, place.longitude)
                    marker.title = place.name
                    marker.map = mapView
                }
            }
            }
            
        }
   }
    
}



