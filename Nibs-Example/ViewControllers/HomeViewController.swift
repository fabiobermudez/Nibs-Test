//
//  ViewController.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private(set) var tableView: UITableView!

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
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: "CarTableViewCell")
        // Do any additional setup after loading the view, typically from a nib.
    }


}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCars
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as? CarTableViewCell else { return UITableViewCell() }
        cell.configurateWithViewMode(viewModel.carCellViewModelForIndex(indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
