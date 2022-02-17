//
//  ViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/16/22.

import UIKit
import CoreML
import Vision
import YPImagePicker
import GoogleMobileAds

class ImageDetectViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UINavigationItem!
    var selectedItems = [YPMediaItem]()
    @IBOutlet weak var adBanner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        textField.title = "#/10"
        
        adBanner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        adBanner.load(GADRequest())
        adBanner.rootViewController = self
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        showPicker()
        adBanner.load(GADRequest())
    }
    
    func result(image: CIImage){
        let config = MLModelConfiguration()
        guard let incepetionV3 = try? VNCoreMLModel(for: Inceptionv3(configuration: config).model) else {
            fatalError("Loading Core ML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: incepetionV3) { request, error in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            
            if let firstResult = results.first {
                self.textField.title = firstResult.identifier
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func showPicker() {
        var config = YPImagePickerConfiguration().self
        config.showsPhotoFilters = false
        config.usesFrontCamera = false
        config.library.maxNumberOfItems = 1
        config.library.minNumberOfItems = 1
        let picker = YPImagePicker(configuration: config)
        picker.imagePickerDelegate = self
        
        picker.didFinishPicking { items, cancelled in
            if cancelled {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            self.selectedItems = items
            
            if let image = items.singlePhoto?.image {
                self.imageView.image = image
                
                guard let ciImage = CIImage(image: image) else {
                    fatalError("Error converting UIImage to CIImage")
                }
                
                self.result(image: ciImage)
                
            }
            
            
            
            picker.dismiss(animated: true, completion: nil)
            
        }
        
        present(picker, animated: true, completion: nil)
    }
    
}

extension ImageDetectViewController : YPImagePickerDelegate {
    
    func shouldAddToSelection(indexPath: IndexPath, numSelections: Int) -> Bool {
        return true // indexPath.row != 2
    }
    
    func imagePickerHasNoItemsInLibrary(_ picker: YPImagePicker) {
        // Can not run
    }
    
}
