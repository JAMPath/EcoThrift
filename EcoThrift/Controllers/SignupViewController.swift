//
//  SignupViewController.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignup(_ sender: UIButton){
        if (passwordTextField.text != confirmPasswordTextField.text){
            print("Error: passwords did not match")
            return
        }
        
        Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "") { result, error in
            
            if let error = error as? NSError {
                print(error.localizedDescription)
            } else {
                print("Successfully created user")
                let newUserInfo = Auth.auth().currentUser
                let email = newUserInfo?.email
                
                self.performSegue(withIdentifier: "signupToMarketSegue", sender: self)
                
            }
        }
    }
    

}
