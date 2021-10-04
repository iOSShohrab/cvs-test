//
//  CSImageCollectionViewCell.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import UIKit
import SDWebImage

class CSImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var viewModel: CSImageCollectionCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        imageView.sd_setImage(with: viewModel?.imageUrl, placeholderImage: UIImage(named: "placeholder"))
        titleLabel.text = viewModel?.title
        authorLabel.text = viewModel?.author
        titleLabel.sizeToFit()
        authorLabel.sizeToFit()
    }
}
