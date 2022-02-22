//
//  SwipeViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/21/22.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet var buttonOutlet: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    
    var slides = [SwipeSlide(title: "Title", desc: "Desc", imageView: #imageLiteral(resourceName: "TexasMeatOnly"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
