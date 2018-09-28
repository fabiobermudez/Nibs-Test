//
//  DetailViewController.swift
//  Nibs-Example
//
//  Created by Joan Pérez on 28.09.18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var fuelTypeLabel: UILabel!
    @IBOutlet weak var licensePlateLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!

    let viewModel: CarDetailViewModel!

    init(_ viewModel: CarDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: DetailViewController.className(), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        titleLabel.text = viewModel.name
        subtitleLabel.text = viewModel.modelName
        transmissionLabel.text = viewModel.transmission
        fuelTypeLabel.text = viewModel.fuelType
        licensePlateLabel.text = viewModel.licensePlate
        colorLabel.text = viewModel.color
    }

}
