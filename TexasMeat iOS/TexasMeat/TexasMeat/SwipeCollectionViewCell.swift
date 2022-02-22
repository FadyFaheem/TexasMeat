//
//  SwipeCollectionViewCell.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/22/22.
//

import UIKit

class SwipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var imageViewLabel: UIImageView!
    
    
    func setup(_ slide: SwipeSlide){
        descriptionLabel.text = slide.title
        imageViewLabel.image = slide.imageView
    }
}
