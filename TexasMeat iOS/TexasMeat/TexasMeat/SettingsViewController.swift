//
//  SettingsViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/20/22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartTutButtonPressed(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: Constants.tutorialPlayableKey)
        performSegue(withIdentifier: Constants.segues.segueSetStart, sender: self)
    }
    
}
