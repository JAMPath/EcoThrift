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
        
    }
    

    
    func addProduct(){
        //let size = 5
        
        
        for i in 1...5{
            let id = Int.random(in: 1...99999)
            let cost = Double.random(in: 1.0...50.0)
            self.ref.child("Products").child("Product_\(id)").setValue("3")
            self.ref.child("Products").child("Product_\(id)").child("Name").setValue("Item-\(id)")
            self.ref.child("Products").child("Product_\(id)").child("Price").setValue("\(cost)")
            self.ref.child("Products").child("Product_\(id)").child("ImgURL").setValue("https://aws.atomretro.com/xlarge/madcap-england-shockwave-knitted-polo-sorrel-brown-3.jpg")
        }
        
        self.ref.child("Thriftstores").setValue("3")
        
        for i in 1...3 {
            let id = Int.random(in: 1...9999)
            let lat = Double.random(in: 32.20...32.40)
            let long = Double.random(in:(-120.50)...(-120.35))
                    self.ref.child("Thriftstores").child("Thriftstore_\(id)").setValue("4")
            self.ref.child("Thriftstores").child("Thriftstore_\(id)").child("lat").setValue("\(lat)")
            self.ref.child("Thriftstores").child("Thriftstore_\(id)").child("long").setValue("\(long)")
            self.ref.child("Thriftstores").child("Thriftstore_\(id)").child("ImgURL").setValue("https://www1.cbn.com/sites/default/files/styles/video_ratio_16_9/public/media/slider/images/salvationarmy_hdv.jpg?itok=ObmqRCjs")
            self.ref.child("Thriftstores").child("Thriftstore_\(id)").child("phone-number").setValue("2097778888")
        }
        
        for i in 1...10 {
            let id = Int.random(in: 1...9999)
            let followers = Int.random(in: 1...999)
            let following = Int.random(in: 1...100)
            let sales     = Float.random(in: 10.0...100000.0)
            
            self.ref.child("Owners").child("Owner#\(id)").setValue(10)
            self.ref.child("Owners").child("Owner#\(id)").child("followers").setValue("\(followers)")
        }
        
        
        
                    
        
    }
    

    @IBAction func onSave(_ sender: Any) {
        i += 1
        
        let API = DatabaseWrapper()
        API.getAllProducts { key, value in
            print("\(key):\(value)")
        }
        
        API.getAllStores { key, value in
            print("\(key):\(value)")
        }
        
        
        
//        self.ref.child("Products").setValue("Product-\(i)")
//        self.ref.child("Products").observeSingleEvent(of: .value) { (snapshot) in
//            if let id = snapshot.value as? String {
//                print("Current database value: \(id)")
//            }
//        }
        
    }
    

}
