//
//  LocationViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/17.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController,CLLocationManagerDelegate {

    var placeLabel : UILabel!
    
    var locationManger : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        placeLabel = UILabel.init()
        placeLabel.frame = CGRect.init(x: 0, y: 70, width: kScreenWidth, height: 30);
        placeLabel.textAlignment = NSTextAlignment.center
        placeLabel.textColor = UIColor.white
        placeLabel.text = "MY Location"
        view.addSubview(placeLabel)
        
        let findButton : UIButton = UIButton.init(type: UIButtonType.custom)
        findButton.setTitle("Find my location", for: UIControlState.normal)
        findButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        findButton.frame = CGRect.init(x: 50, y: 300, width: kScreenWidth - 100, height: 50)
        view.addSubview(findButton)
        findButton.addTarget(self, action: #selector(self.startLocation), for: UIControlEvents.touchUpInside)
    }

    //获取定位权限，开始定位
    func startLocation() -> Void {
        locationManger = CLLocationManager.init()
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
    }
    
    //获取定位结果，并转码
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(manager.location?.coordinate.latitude)
        print(manager.location?.coordinate.longitude)
        CLGeocoder.init().reverseGeocodeLocation(manager.location!) { (placeMarks, error) in
            if error != nil {
                self.placeLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }else{
                if (placeMarks?.count)! > 0 {
                    let pm : CLPlacemark = (placeMarks?[0])!
                    self.showLocation(placeMark: pm)
                }else{
                    self.placeLabel.text = "Problem with the data received from geocoder"
                }
            }
        }
    }
    
    func showLocation(placeMark:CLPlacemark) -> Void {
        
        locationManger.stopUpdatingLocation()
        
        let locality = (placeMark.locality != nil) ? placeMark.locality : ""
        let postalCode = (placeMark.postalCode != nil) ? placeMark.postalCode : ""
        let administrativeArea = (placeMark.administrativeArea != nil) ? placeMark.administrativeArea : ""
        let country = (placeMark.country != nil) ? placeMark.country : ""
 
        placeLabel.text = String.init(format: "%@%@%@%@",locality!,postalCode!,administrativeArea!,country!)
        
    }
}
