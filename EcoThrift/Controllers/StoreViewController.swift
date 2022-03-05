//
//  StoreViewController.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit

class StoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(shapeHeader())
        // Do any additional setup after loading the view.
    }
    

    func shapeHeader() -> UILabel {
        var view = UILabel()

        view.frame = CGRect(x: 0, y: 0, width: 424.07, height: 96.82)

        view.backgroundColor = .white


        view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor


        var parent = self.view!

        parent.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        view.widthAnchor.constraint(equalToConstant: 424.07).isActive = true

        view.heightAnchor.constraint(equalToConstant: 96.82).isActive = true

        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 408.89).isActive = true

        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 4.7).isActive = true
        
        return view

    }

}
