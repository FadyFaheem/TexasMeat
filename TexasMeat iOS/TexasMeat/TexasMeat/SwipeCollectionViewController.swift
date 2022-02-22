//
//  SwipeCollectionViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/21/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class SwipeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .green
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.tutorialCell, for: indexPath)
        return cell
    }

}

