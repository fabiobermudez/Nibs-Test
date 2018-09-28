//
//  CarTableViewCell.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet var carImageView: UIImageView!
    @IBOutlet var carNameLabel: UILabel!
    @IBOutlet var carInfoLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        carNameLabel.text = nil
        carInfoLabel.text = nil
    }

    func configurateWithViewMode(_ viewModel: CarCellViewModel) {
        carNameLabel.text = viewModel.carName
        carInfoLabel.text = viewModel.carInfo
    }
}
