//
//  ViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/16/22.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UINavigationItem!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        textField.title = "#/10"
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
    }
    


}

