//
//  OnboardingViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/22/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nxtButton: UIButton!
    
    var slides = [OnboardingSlide(description: "Cool Label Text", image: #imageLiteral(resourceName: "yp_play"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nxtButtonPressed(_ sender: UIButton) {
    }
    

}
