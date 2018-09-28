//
//  ViewController.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel: CarListViewModel!

    init(_ viewModel: CarListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

