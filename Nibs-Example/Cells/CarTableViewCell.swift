//
//  CarTableViewCell.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carInfoLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configurateWithViewMode(_ viewModel: CarCellViewModel) {

    }

}
