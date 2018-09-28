//
//  CarTableViewCell.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import UIKit
import Alamofire

class CarTableViewCell: UITableViewCell {

    @IBOutlet var carImageView: UIImageView!
    @IBOutlet var carNameLabel: UILabel!
    @IBOutlet var carInfoLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        carNameLabel.text = nil
        carInfoLabel.text = nil
        carImageView.image = #imageLiteral(resourceName: "stockImage")
    }

    func configurateWithViewMode(_ viewModel: CarCellViewModel) {
        carNameLabel.text = viewModel.carName
        carInfoLabel.text = viewModel.carInfo
        //carImageView.fetchImage(with: URL(string: viewModel.imageUrl))
    }
}
