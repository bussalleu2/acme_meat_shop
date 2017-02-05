//
//  FirstViewController.swift
//  ACME
//
//  Created by Alba on 4/2/17.
//  Copyright © 2017 bussalleu. All rights reserved.
//

import UIKit

class PresentationsController: UIViewController {
    
    @IBOutlet weak var imgQuality: UIImageView!
    @IBOutlet weak var imgTransport: UIImageView!
    @IBOutlet weak var imgCookedPM: UIImageView!
    @IBOutlet weak var imageRestaurant: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("appName", comment: "")
        let rc = RestConnections()
        rc.getPhotos { (photoList, error) in
            
            if let _ = error {
                // TODO: Error
            } else {
                
                for photo in photoList!
                {
                    if(photo.title == "meat-01b")
                    {
                        self.imgQuality.downloadedFrom(link: (photo.url));
                    }
                    else if(photo.title == "7644")
                    {
                        self.imgTransport.downloadedFrom(link: (photo.url));
                    }
                    else if(photo.title == "restaurant-hotel-barcelo-santo-domingo-237-10481")
                    {
                        self.imageRestaurant.downloadedFrom(link: (photo.url));
                    }
                    else if(photo.title == "cache_10484576")
                    {
                        self.imgCookedPM.downloadedFrom(link: (photo.url));
                    }
                    
                }
            }
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

