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
        super.init(nibName: HomeViewController.className(), bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: CarTableViewCell.className(), bundle: nil), forCellReuseIdentifier: CarTableViewCell.className())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 126
        viewModel.requestData { [weak self] (_) in
            self?.tableView.reloadData()
        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCars
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.className(), for: indexPath) as? CarTableViewCell else { return UITableViewCell() }
        if let viewModel = viewModel.carCellViewModelForIndex(indexPath.row) { cell.configurateWithViewMode(viewModel) }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel.carDetailViewModel(for: indexPath) else { return }
        let detailViewController = DetailViewController(viewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
