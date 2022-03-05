//
//  TeaGreenButton.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit

class TeaGreenButton: UIView {

    @IBOutlet weak var button: UIButton!
    
    let nibName = "TeaGreenButton"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func set(text: String){
        button.setTitle(text, for: UIControl.State.normal)
    }

}
