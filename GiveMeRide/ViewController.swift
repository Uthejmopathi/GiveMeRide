//
//  ViewController.swift
//  GiveMeRide
//
//  Created by Uthej Mopathi on 9/28/20.
//  Copyright © 2020 Uthej Mopathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameEntryTextField: UITextField!
    @IBOutlet weak var passwordEntryTextField: UITextField!
    @IBOutlet weak var loginButtonTapped: UIButton!
    @IBOutlet weak var logoSign: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
//        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemIndigo.cgColor]
//        gradient.colors = [UIColor(red: 2, green: 4, blue: 50, alpha: 1)]
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "loginToHomePageSegue", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationLoginToHomePage = segue.destination as? HomePageViewController
//    }

}

