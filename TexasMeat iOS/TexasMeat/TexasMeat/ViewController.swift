//
//  ViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/16/22.
//

import UIKit
import CoreML
import Vision
import YPImagePicker

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UINavigationItem!
    var selectedItems = [YPMediaItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        textField.title = "#/10"
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        showPicker()
    }
    
    func showPicker() {
        var config = YPImagePickerConfiguration().self
        config.showsPhotoFilters = false
        let picker = YPImagePicker(configuration: config)
        picker.imagePickerDelegate = self
        
        picker.didFinishPicking { items, cancelled in
            if cancelled {
                print("Picker was canceled")
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            self.selectedItems = items
            self.imageView.image = items.singlePhoto?.image
            picker.dismiss(animated: true, completion: nil)
        }
        
        present(picker, animated: true, completion: nil)
    }
    
}

extension ViewController : YPImagePickerDelegate {
    
    func shouldAddToSelection(indexPath: IndexPath, numSelections: Int) -> Bool {
        return true // indexPath.row != 2
    }
    
    func imagePickerHasNoItemsInLibrary(_ picker: YPImagePicker) {
        // Can not run
    }
    
}
