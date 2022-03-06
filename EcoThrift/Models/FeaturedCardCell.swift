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
    
    
    
    public func configure(with model: Model){
        self.imageView.af.setImage(withURL: URL(string: model.imageURL )!)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = "USD"
        formatter.numberStyle = .currency
        
        let string = model.priceLabel[0..<5]
        self.productPriceLabel.text = "$\(string)"
        self.productLabel.text = model.productLabel
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
}


extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
