//
//  AuthenticationViewController.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit
import Firebase
import FirebaseDatabase

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var ref: DatabaseReference!
    var i: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        i = 1
        self.ref.child("Products").setValue("Product-\(1)")
    }
    
    
    
    func addProduct(){
        let size = 5
        self.ref.child("Products").setValue(5)
        
        for i in 1...5{
            let id = Int.random(in: 1...99999)
            self.ref.child("Products").child("Product_\(id)").setValue("")
        }
                    
        
    }
    

    @IBAction func onSave(_ sender: Any) {
        i += 1
        
        addProduct()
//        self.ref.child("Products").setValue("Product-\(i)")
//        self.ref.child("Products").observeSingleEvent(of: .value) { (snapshot) in
//            if let id = snapshot.value as? String {
//                print("Current database value: \(id)")
//            }
//        }
        
    }
    

}
