//
//  HomePageViewController.swift
//  GiveMeRide
//
//  Created by Uthej Mopathi on 9/28/20.
//  Copyright © 2020 Uthej Mopathi. All rights reserved.
//

import UIKit
import MapKit

class HomePageViewController: UIViewController {

    var options = ["Drive", "Ride"]
    var indexValue = 0
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    var locationServiceManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.visibleViewController!.title = "Home"
        locationServiceManager = CLLocationManager()
        locationServiceManager.delegate = self
        
        locationServiceManager.requestAlwaysAuthorization()
        locationServiceManager.requestWhenInUseAuthorization()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func homePageButtonTapped(_ sender: Any) {
        switch indexValue {
        case 1:
            performSegue(withIdentifier: "RideButtonSegue", sender: nil)
        default:
            performSegue(withIdentifier: "SearchButtonSegue", sender: nil)
        }
    }
    
    func setupLocationManager() {
            locationServiceManager.desiredAccuracy = kCLLocationAccuracyBest
            locationServiceManager.startUpdatingLocation()
        }
    
}

extension HomePageViewController: CLLocationManagerDelegate {
//func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//    switch status {
//    case .authorizedAlways:
//        mapView.showsUserLocation = true
//        setupLocationManager()
//    case .authorizedWhenInUse:
//        mapView.showsUserLocation = true
//        setupLocationManager()
//    case .denied:
//        // With out location ->  alert
//        print("user selected denied")
//    default:
//        // With out location -> alert
//        print("user selected other")
//    }
//}
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\(locations.last?.coordinate.latitude ?? 0) + \(locations.last?.coordinate.longitude ?? 0)")
        
        
        
        
        guard let lastCoordinate = locations.last?.coordinate else { return }

        let region = MKCoordinateRegion(center: lastCoordinate,
                                        latitudinalMeters: 200,
                                        longitudinalMeters: 200)
        mapView.setRegion(region, animated: true)
        
        let anno = MKPointAnnotation()
        anno.coordinate = lastCoordinate
        mapView.addAnnotation(anno)
    }
}




extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        cell?.userOptionsButton.setTitle(options[indexPath.row], for: .normal)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexValue = indexPath.row
    }
    
    
}

class CollectionViewCell: UICollectionViewCell{
    static let identifier = "CollectionViewCell"
    @IBOutlet weak var userOptionsButton: UIButton!

    
}

