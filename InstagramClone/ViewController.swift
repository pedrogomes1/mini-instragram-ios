//
//  ViewController.swift
//  InstagramClone
//
//  Created by Pedro Henrique on 02/06/23.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBAction func handleSignIn(_ sender: Any) {
        
        if emailTxt.text != "" && passwordTxt.text != "" {
            Auth.auth().signIn(withEmail: emailTxt.text!, password: passwordTxt.text!) { (authdata, error) in
                
                if error != nil {
                    self.dispatchAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            dispatchAlert(title: "Error", message: "Email our password is missing")
        }
        
        
      
    }
    
    @IBAction func handleSignUp(_ sender: Any) {
        
        if emailTxt.text != "" && passwordTxt.text != "" {
            Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) { (authdata, error) in
                
                if error != nil {
                    self.dispatchAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            dispatchAlert(title: "Error", message: "Email our password is missing")
        }
    }
    
    func dispatchAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: false)
    }
}

