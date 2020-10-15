//
//  SignUpPageViewController.swift
//  GiveMeRide
//
//  Created by Uthej Mopathi on 10/7/20.
//  Copyright © 2020 Uthej Mopathi. All rights reserved.
//

import UIKit

class SignUpPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameEntry:UITextField!
    @IBOutlet weak var lastNameEntry:UITextField!
    @IBOutlet weak var userNameEntry:UITextField!
    @IBOutlet weak var emailEntry:UITextField!
    @IBOutlet weak var passwordEntry:UITextField!
    @IBOutlet weak var verifyPasswordEntry:UITextField!
    @IBOutlet weak var SignUpButton:UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameEntry.delegate = self
        lastNameEntry.delegate = self
        userNameEntry.delegate = self
        emailEntry.delegate = self
        passwordEntry.delegate = self
        verifyPasswordEntry.delegate = self
        

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
//        let newViewController = ViewController()
//        self.present(newViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameEntry {
            firstNameEntry.resignFirstResponder()
        }   else if textField == lastNameEntry {
                lastNameEntry.resignFirstResponder()
        }
        else if textField == userNameEntry {
                lastNameEntry.resignFirstResponder()
        }
        else if textField == emailEntry {
                lastNameEntry.resignFirstResponder()
        }
        else if textField == verifyPasswordEntry {
                lastNameEntry.resignFirstResponder()
        }
        else if textField == passwordEntry {
                lastNameEntry.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if firstNameEntry.text != ""{
            if lastNameEntry.text != ""{
                if userNameEntry.text != ""{
                    if emailEntry.text != ""{
                        if passwordEntry.text != ""{
                            if verifyPasswordEntry.text != ""{
                                  performSegue(withIdentifier: "BackToLoginSegue", sender: nil)
                            }
                            else {
                                let alertController = UIAlertController(title:"Warning", message: "Password Not Matching", preferredStyle: UIAlertController.Style.alert)
                                    let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                                    alertController.addAction(alertAction)
                                    present(alertController, animated: true, completion: nil)
                            }
                        }
                        else {
                            let alertController = UIAlertController(title:"Warning", message: "Password Not Strong Enough", preferredStyle: UIAlertController.Style.alert)
                            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                            alertController.addAction(alertAction)
                            present(alertController, animated: true, completion: nil)
                        }
                    }
                    else {
                        let alertController = UIAlertController(title:"Warning", message: "UserName Used", preferredStyle: UIAlertController.Style.alert)
                        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                        alertController.addAction(alertAction)
                        present(alertController, animated: true, completion: nil)
                    }
                }
                else {
                    let alertController = UIAlertController(title:"Warning", message: "Please Enter Last Name", preferredStyle: UIAlertController.Style.alert)
                    let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
                }
            }
            else {
                let alertController = UIAlertController(title:"Warning", message: "Please Enter First Name", preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
