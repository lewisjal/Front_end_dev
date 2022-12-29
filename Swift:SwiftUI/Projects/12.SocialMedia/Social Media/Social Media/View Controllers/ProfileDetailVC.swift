//
//  ProfileDetailVC.swift
//  Social Media
//
//  Created by M_955328 on 3/3/22.
//

import Foundation
import UIKit
import MapKit

class ProfileDetailVC: UIViewController{
    
    var users: UserModal?
    var userPassedArray = [UserModal]()
    
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileUsernameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    @IBOutlet weak var profileAddressLabel: UILabel!
    @IBOutlet weak var profilePhoneLabel: UILabel!
    @IBOutlet weak var profileWebsiteLabel: UILabel!
    @IBOutlet weak var profileCompanyLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for user in userPassedArray{
            print(user)
            profileNameLabel.text = user.name
            profileUsernameLabel.text =  user.username
            profileEmailLabel.text = user.email
            profileAddressLabel.text = "\(user.address?.street) \(user.address?.suite) \(user.address?.city) \(user.address?.zipcode)"
            profilePhoneLabel.text = user.phone
            profileWebsiteLabel.text = user.website
            if let company = user.company {
                profileCompanyLabel.text = "\(company.name) \(company.bs) \(company.catchPhrase)"
            }
        }
       
//        checkLocationServices()
        fetchPositionsOnMap()
        
    }
    
    func fetchPositionsOnMap() {
        let annotations = MKPointAnnotation()
//        annotations.coordinate = CLLocationCoordinate2D(latitude:users?.address?.geo?.latitude, longitude: users?.address?.geo?.longitude)
//        mapView.addAnnotation(annotations)
    }
    
    func updateLocationOnMap(to location: CLLocation, with title: String?) {
            
            let point = MKPointAnnotation()
            point.title = title
            point.coordinate = location.coordinate
            self.mapView.removeAnnotations(self.mapView.annotations)
            self.mapView.addAnnotation(point)
            let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            self.mapView.setRegion(viewRegion, animated: true)
    }
                    
    func checkLocationServices() {
      if CLLocationManager.locationServicesEnabled() {
        checkLocationAuthorization()
      } else {
        // Show alert letting the user know they have to turn this on.
      }
    }
    
    func checkAuthorizationStatus() {
      switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse: break
        case .denied: break
        case .notDetermined: break
        case .restricted: break
        case .authorizedAlways: break
      }
    }
    
    func checkLocationAuthorization() {
      switch CLLocationManager.authorizationStatus() {
      case .authorizedWhenInUse:
        mapView.showsUserLocation = true
       case .denied: // Show alert telling users how to turn on permissions
       break
      case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
      case .restricted: // Show an alert letting them know what’s up
       break
      case .authorizedAlways:
       break
      }
    }
    
}
    

