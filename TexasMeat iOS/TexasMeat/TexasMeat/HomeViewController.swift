//
//  HomeViewController.swift
//  TexasMeat
//
//  Created by Fady Faheem on 2/17/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var basicCells : [BasicCell] = [BasicCell(image: #imageLiteral(resourceName: "TexasMeatOnly"), textLabel: "Oven Roasted", parent: "none"),
                                    BasicCell(image: #imageLiteral(resourceName: "TexasMeatOnly"), textLabel: "Grilled", parent: "none"),
                                    BasicCell(image: #imageLiteral(resourceName: "TexasMeatOnly"), textLabel: "Pan Fried", parent: "none"),
                                    BasicCell(image: #imageLiteral(resourceName: "TexasMeatOnly"), textLabel: "Seared", parent: "none"),
                                    BasicCell(image: #imageLiteral(resourceName: "TexasMeatOnly"), textLabel: "Braising", parent: "none")]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "BasicTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.reusableBasicCell)
        // Do any additional setup after loading the view.
    }



}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicCells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = basicCells[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reusableBasicCell, for: indexPath) as! BasicTableViewCell
        cell.basicImageView.image = message.image
        cell.titleLabel.text = message.textLabel

        return cell
    }


}
