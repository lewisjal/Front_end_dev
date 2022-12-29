//
//  MapKitViewController.swift
//  Social Media
//
//  Created by M_955328 on 3/7/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let stadiums = [Stadium(name: "Emirates Stadium", lattitude: 51.5549, longtitude: -0.108436),
                   Stadium(name: "Stamford Bridge", lattitude: 51.4816, longtitude: -0.191034),
                   Stadium(name: "White Hart Lane", lattitude: 51.6033, longtitude: -0.065684),
                   Stadium(name: "Olympic Stadium", lattitude: 51.5383, longtitude: -0.016587),
                   Stadium(name: "Old Trafford", lattitude: 53.4631, longtitude: -2.29139),
                   Stadium(name: "Anfield", lattitude: 53.4308, longtitude: -2.96096),
                   Stadium(name: "Coyote Hills", lattitude: 37.5566, longtitude: -122.0941)]
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       checkLocationServices()
       fetchStadiumsOnMap(stadiums)
    }
    
    func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          stadium.lattitude, longitude: stadium.longtitude)
        mapView.addAnnotation(annotations)
      }
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

struct Stadium {
  var name: String
  var lattitude: CLLocationDegrees
  var longtitude: CLLocationDegrees
}
