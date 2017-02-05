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
                                              longitude: 2.166508, zoom: 13)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        addMarks(mapView: mapView)
        
    }
    
    func addMarks(mapView: GMSMapView)
    {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(41.385813, 2.166508)
        marker.title = NSLocalizedString("shop1", comment: "")
        marker.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2DMake(41.385397, 2.152407)
        marker2.title = NSLocalizedString("shop2", comment: "")
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2DMake(41.398042, 2.175790)
        marker3.title = NSLocalizedString("shop3", comment: "")
        marker3.map = mapView
    }
    
    
    
    
}
