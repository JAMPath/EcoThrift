//
//  ProfileViewController.swift
//  EcoThrift
//
//  Created by Moises Limon on 3/5/22.
//

import AlamofireImage
import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var locationAddress: UILabel!
    //
    @IBOutlet weak var followingValue: UILabel!
    @IBOutlet weak var followerValue: UILabel!
    @IBOutlet weak var productsSold: UILabel!
    @IBOutlet weak var biographyText: UILabel!
    //
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var postCell: UICollectionViewCell!
    
    var posts = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "com.JAM.EcoThrift.PostCell", for: indexPath) as! PostCell
        //use AlamoFireImage to get Image
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Loading up the details screen")
        //Find the selected movie
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let post = posts[indexPath.item]
        
        //Pass the selected movie to the details view controller
        let detailsViewController = segue.destination as! PostDetailsViewController

    }
    

}
