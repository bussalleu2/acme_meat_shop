//
//  Photo.swift
//  ACME
//
//  Created by Alba on 4/2/17.
//  Copyright © 2017 bussalleu. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    
    let id: String
    let userID: String
    let secretKey: String
    let server: String
    let farm: String
    let url:String
    let title:String
    
    
    init(title:String, id: String, userID: String, secretKey: String, server: String, farm: Int, url: String) {
        
        self.id = id
        self.userID = userID
        self.secretKey = secretKey
        self.server = server
        self.farm = String(farm)
        self.url = url;
        self.title  = title
        
    }
    
    
    
}
