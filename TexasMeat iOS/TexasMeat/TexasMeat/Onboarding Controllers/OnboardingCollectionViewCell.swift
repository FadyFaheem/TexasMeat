//
//  OnboardingCollectionViewCell.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/22/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var slideImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    func setup (_ slide: OnboardingSlide){
        slideImageView.image = slide.image
        descriptionLabel.text = slide.description
    }
}
