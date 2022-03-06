//
//  StoreViewController.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit
import FirebaseDatabase

struct Model {
    let imageURL: String
    let productLabel: String
    let priceLabel: String
    
    init(text: String!, imageURL: String!, productLabel:String!, priceLabel:String ){
        self.imageURL = imageURL
        self.productLabel = productLabel
        self.priceLabel = priceLabel
    }
}

class StoreViewController: UIViewController {
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var shopTable: UITableView!
  
    
     var models = [Model]()
    let rootRef = Database.database().reference(withPath: "products")
    var refObservers: [DatabaseHandle] = []
    var data: [String: [String:Any]] = [:]
    
    @IBOutlet weak var pageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        filterCollectionView.dataSource = self
        filterCollectionView.delegate   = self
        shopTable.register(FeaturedTableViewCell.nib(), forCellReuseIdentifier: FeaturedTableViewCell.identifier  )
        shopTable.dataSource = self
        shopTable.delegate   = self
        shopTable.reloadData()
        pageLabel.textColor = UIColor(red: 0.125, green: 0.306, blue: 0.29, alpha: 1)

        pageLabel.font = UIFont(name: "SFProText-Heavy", size: 28)
        print(models.count)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func getData(){
        var i = 0
        let API = DatabaseWrapper()
        API.getAllProducts { key, value in
            print("\(value["ImgURL"]!)")
            self.data[key] = value
            let url = "\(value["ImgURL"]!)"
            let price = "\(value["Price"]!)"
            let name = "\(value["Name"]!)"
            
            self.models.append(Model(text: key, imageURL: url, productLabel: name, priceLabel: price))
            print(self.models[i])
            i += 1
            self.shopTable.reloadData()
        }
        
        
        
        
    }
    

   

}

extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as! FilterCollectionViewCell
        
        cell.filterProtoButton.titleLabel?.text = "Filter"
        cell.filterProtoButton.titleLabel?.textColor = .black
        cell.filterProtoButton.layer.cornerRadius = 5
        cell.filterProtoButton.backgroundColor = UIColor.clear
        cell.filterProtoButton.layer.borderWidth = 1
        cell.filterProtoButton.layer.borderColor = UIColor.black.cgColor
        
        
        return cell
    }
    
    
    
    
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "FeaturedTableViewCell", for: indexPath) as! FeaturedTableViewCell)

        cell.configure(with: models)
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }


}
