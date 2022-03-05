//
//  LoginViewController.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtone: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onLogin(_ sender: UIButton){
        Auth.auth().signIn(withEmail: emailTextField.text ?? "" , password: passwordTextField.text ?? "") { Auth, error in
            if let error = error as NSError? {
                print(error.localizedDescription)
            } else {
                print("Logged in")
                self.performSegue(withIdentifier: "ToMapSeugue", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    

}
