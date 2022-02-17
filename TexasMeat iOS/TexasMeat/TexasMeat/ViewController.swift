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
    let config = MLModelConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        textField.title = "#/10"
        imagePicker.delegate = self
        imagePicker.sourceType = .camera // .photoLibrary || .camera
        imagePicker.allowsEditing = true
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func result(image: CIImage) {
        guard let inceptionV3 = try? VNCoreMLModel(for: Inceptionv3(configuration: config).model) else {
            fatalError("Failed loading inceptionV3 Model")
        }
        
        let request  = VNCoreMLRequest(model: inceptionV3) { request, error in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Failed to process Image through Model")
            }
            
            if let outputResults = results.first {
                self.textField.title = outputResults.identifier.description
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = userImage
            
            guard let ciImage = CIImage(image: userImage) else {
                fatalError("Failed to convert UIImage to CIImage")
            }
            
            result(image: ciImage)
            
        }
        imagePicker.dismiss(animated: true)
    }
}
