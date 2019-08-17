//
//  ViewController.swift
//  Swift_30Day_6
//
//  Created by ZhangYi on 2019/8/16.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var myLocationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func findMyLocationButtonDidClick(_ sender: Any) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.myLocationLabel.text = "Error while updating location " + error.localizedDescription
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
            guard error == nil else {
                self.myLocationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0 {
                let pm = placemarks!.first
                self.displayLocationInfo(pm)
            } else {
                self.myLocationLabel.text = "Problem with the data received from geocoder"
            }
        }
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.myLocationLabel.text = postalCode! + " " + locality!
            
            self.myLocationLabel.text?.append("\n" + administrativeArea! + ", " + country!)
        }
        
    }
}
