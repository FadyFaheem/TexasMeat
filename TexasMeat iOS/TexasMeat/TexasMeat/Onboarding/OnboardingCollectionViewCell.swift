//
//  OnboardingCollectionViewCell.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/22/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideInfoLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideInfoLabel.text = slide.desc
    }
}
