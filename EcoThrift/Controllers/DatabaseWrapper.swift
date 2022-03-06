//
//  DatabaseWrapper.swift
//  EcoThrift
//
//  Created by Moises Limon on 3/5/22.
//

import Foundation
import Firebase
import FirebaseDatabase


class DatabaseWrapper{
    var baseRef: DatabaseReference!
    var products: [String:Any]
    var handlers: [() -> Void]
    
    init(){
        baseRef = Database.database().reference()
        products = [:]
        handlers = []
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
            return NSLocalizedString("", comment: "")
        }
    }
}
