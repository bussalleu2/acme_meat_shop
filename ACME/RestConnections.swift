//
//  RestConnections.swift
//  ACME
//
//  Created by Alba on 4/2/17.
//  Copyright © 2017 bussalleu. All rights reserved.
//

import UIKit

class RestConnections: NSObject {
    
    
    
    func getPhotos(completion: @escaping ([Photo]?, Error?)->()){
        let requestURL = URL(string:"\(Constants.baseURL)method=flickr.people.getPublicPhotos&api_key=\(Constants.apiKeyFlickr)&per_page=4&user_id=\(Constants.userFlickr)&format=json&nojsoncallback=1")
        URLSession.shared.dataTask(with: requestURL!) { data, response, error in
            if error != nil{
                print("Error -> \(error)")
                return
            }
            
            do {
                let result = try JSONSerialization.jsonObject(with:data!, options: []) as? [String:AnyObject]
                
                let jsonPhotos = result?["photos"] as? [String:AnyObject]
                let arrPhotos = jsonPhotos?["photo"] as? [[String:AnyObject]]
                var imgs  = [Photo]()
                for p in arrPhotos!
                {
                    
                    let farm: Int = (p["farm"] as? Int)!
                    let server: String = (p["server"] as? String)!
                    let secret: String = (p["secret"] as? String)!
                    let userID: String = (p["owner"] as? String)!
                    let id: String = (p["id"] as? String)!
                    let title : String = (p["title"] as? String)!
                    let photoURL: String = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
                    let photo = Photo(title: title,id: id, userID: userID, secretKey: secret, server: server, farm: farm,url:photoURL)
                    imgs.append(photo)
                    
                }
                completion(imgs,nil);
                
                
                print("Result -> \(result)")
                
            } catch {
                print("Error -> \(error)")
            }
            }.resume()
        
        
    }
    
}


private func executeRequest(withURL url: URL, completion: @escaping ([String:AnyObject]?, Error?)->()) {
    
    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        
        if let error = error {
            completion(nil, error)
        } else if let data = data {
            
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] {
                    completion(json, nil)
                }
                
            } catch {
            }
        }
        
    }).resume()
}


