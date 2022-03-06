//
//  FeaturedCardCell.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit
import AlamofireImage
class FeaturedCardCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    static let identifier = "FeaturedCardCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FeaturedCardCell", bundle: nil)
    }
    
    
    var models = [Model]()
    public func configure(with model: Model){
        self.imageView.af.setImage(withURL: model.imageURL)
        self.productLabel.text = model.productLabel
        self.productPriceLabel.text = model.priceLabel
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
}
