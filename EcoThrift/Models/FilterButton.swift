//
//  FilterButton.swift
//  EcoThrift
//
//  Created by Alex Roman on 3/5/22.
//

import UIKit

struct FilterButtonViewModel {
    
    var primaryText: String
    var secondaryText: String
    
}

final class FilterButton: UIButton {

    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor     = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor     = .gray
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()

        
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(primaryLabel)
        addSubview(secondaryLabel)
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    func configure(with viewModel: FilterButtonViewModel){
        primaryLabel.text = viewModel.primaryText
        primaryLabel.text = viewModel.secondaryText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/2)
        secondaryLabel.frame = CGRect(x: 0, y: frame.size.height/2, width: frame.size.width, height: frame.size.width/2)
    }
}
