//
//  OnboardingViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/22/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pgControl: UIPageControl!
    var currentPage : Int = 0 {
        didSet {
            nextButton.setTitle((currentPage == slides.count - 1) ? "Get Started" : "Next", for: .normal)
        }
    }
    
    var slides : [OnboardingSlide] = [OnboardingSlide(desc: "Hello", image: #imageLiteral(resourceName: "TexasMeatOnly")),
                                      OnboardingSlide(desc: "Slide2 owo", image: #imageLiteral(resourceName: "TexasMeatOnly")),
                                      OnboardingSlide(desc: "Slide4 owo", image: #imageLiteral(resourceName: "TexasMeatOnly")),
                                      OnboardingSlide(desc: "Slide3 owo", image: #imageLiteral(resourceName: "TexasMeatOnly"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setTitle("Next", for: .normal)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        let isDone = (sender.currentTitle == "Get Started")
        
        if !isDone {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pgControl.currentPage = currentPage
        } else {
            performSegue(withIdentifier: Constants.segues.segueTutHome, sender: self)
            UserDefaults.standard.set(false, forKey: Constants.tutorialPlayableKey)
        }
    }
    
}

extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Constants.tutorialCell, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = collectionView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pgControl.currentPage = currentPage
    }
}
