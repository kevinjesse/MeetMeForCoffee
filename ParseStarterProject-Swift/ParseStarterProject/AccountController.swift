//
//  ViewController.swift
//  FacebookTutorial
//


import UIKit
import Parse
import MapKit

@available(iOS 8.0, *)
class AccountController: UIViewController {
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var MeMap: MKMapView!
    @IBAction func logout(sender: UIButton) {
        PFUser.logOut()
        self.performSegueWithIdentifier("goLogin", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        MeMap.showsUserLocation = true
        MeMap.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true);
    }
//    @IBAction func logoutTapped(sender: AnyObject) {
//        PFUser.logOut()
//        //print(PFUser.currentUser()?.username)
//        self.performSegueWithIdentifier("goLogin", sender: self)
//    }
//    @IBAction func logoutTapped(sender: UIButton) {
//        PFUser.logOut()
//        print(PFUser.currentUser()?.username)
//        //self.performSegueWithIdentifier("logoutSuccess", sender: self)
//    }
}


