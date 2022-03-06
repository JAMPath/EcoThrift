//
//  DatabaseWrapper.swift
//  EcoThrift
//
//  Created by Moises Limon on 3/5/22.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import UIKit


class DatabaseWrapper{
    var baseRef: DatabaseReference!
    var products: [String:Any]
    var handlers: [() -> Void]
    var storage:Storage!
    var storageRef:StorageReference!
    
    init(){
        baseRef = Database.database().reference()
        products = [:]
        handlers = []
        storage  = Storage.storage()
        storageRef = storage.reference()
    }
    
    
    /// Gets all products by looping through database
    /// - Parameter completionHandler: completionHandler description
    func getAllProducts(completionHandler: @escaping (_ key:Any, _ value: Any)->Void){
        baseRef.child("Products").observeSingleEvent(of: .value) { snapshot in
            if let dict = snapshot.value as? Dictionary<String, Dictionary<String, Any>> {
                for (key, value) in dict {
                    completionHandler(key,value)
                }
            }
        }
    }
    
    
    func getAllStores(comletionHandler: @escaping (_ key:Any, _ value: Any)->Void){
        baseRef.child("Thriftstores").observeSingleEvent(of: .value) { snapshot in
            if let dict = snapshot.value as? Dictionary<String, Dictionary<String, Any>> {
                for (key, value) in dict {
                    comletionHandler(key,value)
                }
            }
        }
    }
    
    func getAllOwners(completionHandler: @escaping (_ key:Any, _ value: Any)->Void){
        baseRef.child("Owners").observeSingleEvent(of: .value) { snapshot in
            if let dict = snapshot.value as? Dictionary<String, Dictionary<String, Any>> {
                for (key, value) in dict {
                    completionHandler(key,value)
                }
            }
        }
    }
    
    func postProduct(name:String, price:Double, size:Character, image: UIImage) throws {
        let id = Int.random(in: 1...9999)
        let sizes = ["s","m","l"]
        baseRef.child("Products").child("Product_\(id)").setValue("3")
        baseRef.child("Products").child("Product_\(id)").child("Name").setValue(name)
        baseRef.child("Products").child("Product_\(id)").child("Price").setValue(price)
        baseRef.child("Products").child("Product_\(id)").child("Size").setValue(sizes[Int.random(in: 0...2)])
        
        let urlPath = try uploadImage(to: "images/products", image: image)

        if urlPath == nil{
            throw DatabaseError.serverError
        }
        baseRef.child("Products").child("Product_\(id)").child("ImgURL").setValue(urlPath)
        
    }
    
    private func uploadImage(to storagePath:String, image:UIImage) throws ->URL?{
        let imageData = image.pngData()
        let locationRef = storageRef.child(storagePath)
        
        if imageData != nil{
            throw DatabaseError.clientError
    
        }
        
        
        
        var urlPath:URL?
        let uploadTask = locationRef.putData(imageData!, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                print("Unable to upload")
                return
            }
            let size = metadata.size
            
            locationRef.downloadURL { url, error in
                guard let downloadURL = url else {
                    return
                }
                
                urlPath = url
            }
        }
        
        return urlPath
        
    }
    
}


public enum DatabaseError: Error{
    case missingResource
    case droppedRequest
    case serverError
    case clientError
}

extension DatabaseError: LocalizedError {
    public var errorDescription: String?{
        switch self{
        case .serverError:
            return NSLocalizedString("There was a failure retrieving the resources", comment: "It may no longer be available or please try again")
        case .missingResource:
            return NSLocalizedString("", comment: "")
        case .droppedRequest:
            return NSLocalizedString("", comment: "")
        case .clientError:
            return NSLocalizedString("Encountered an error while preparing to upload resources", comment: "")
        }
    }
}
