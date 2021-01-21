//
//  LoginScreenViewController.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 14/12/2020.
//

import UIKit
import FirebaseAuth

class LoginScreenViewController: UIViewController {
            
    @IBOutlet weak var username_input: UITextField!
    @IBOutlet weak var password_input: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        //Create a cleaned version of the text field
        let username = username_input.text!
        let password = password_input.text!
        
        Auth.auth().signIn(withEmail: username, password: password){
            (result, error) in
            
            if error != nil{
                
                let loginAlert = UIAlertController(title: "Login Mislukt", message: "Uw gebruikersnaam en wachtwoord komen niet overeen.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default){
                    UIAlertAction in
                    print("Failed Login")
                }
                loginAlert.addAction(okAction)
                self.present(loginAlert, animated: true, completion: nil)
                
            }else{
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: "BeginNav") as? TabBarController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
    }
}
