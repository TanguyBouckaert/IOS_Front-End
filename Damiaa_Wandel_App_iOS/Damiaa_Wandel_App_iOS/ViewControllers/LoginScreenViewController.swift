//
//  LoginScreenViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 14/12/2020.
//

import UIKit

class LoginScreenViewController: UIViewController {
            
    @IBOutlet weak var username_input: UITextField!
    @IBOutlet weak var password_input: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        if(username_input.text == "Tony" && password_input.text == "Tony"){
            performSegue(withIdentifier: "LoggedIn", sender: self)
        }else{
            
            self.perform(#selector(displayAlert), with: nil, afterDelay: 300)
        }
    }
    
    @objc func displayAlert(){
        
        let loginAlert = UIAlertController()
        loginAlert.title = "Login Mislukt"
        loginAlert.message = "Uw gebruikersnaam en wachtwoord komen niet overeen."
        self.present(loginAlert, animated: true, completion: nil)
        
    }
    
}
