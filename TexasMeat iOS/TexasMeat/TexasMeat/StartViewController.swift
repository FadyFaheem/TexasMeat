//
//  StartViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/21/22.
//

import UIKit

class StartViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var tutorialPlayable : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func TutorialSet(_ isTrue: Bool){
        defaults.set(isTrue, forKey: Constants.tutorialPlayableKey)
        tutorialPlayable = defaults.bool(forKey: Constants.tutorialPlayableKey)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaults.standard.object(forKey: Constants.tutorialPlayableKey) != nil {
            tutorialPlayable = defaults.bool(forKey: Constants.tutorialPlayableKey)
        } else {
            TutorialSet(true)
        }
        
        if (tutorialPlayable) {
            performSegue(withIdentifier: Constants.segues.segueStartTut, sender: self)
        } else if (!tutorialPlayable) {
            performSegue(withIdentifier: Constants.segues.segueStartHome, sender: self)
        }
    }
    
}
