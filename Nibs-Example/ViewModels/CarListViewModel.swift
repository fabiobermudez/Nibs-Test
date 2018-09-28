//
//  CarListViewModel.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import Foundation

struct CarListViewModel {

    var numberOfCars: Int {
        return 0
    }

    func carCellViewModelForIndex(_ index: Int) -> CarCellViewModel  {
        return CarCellViewModel()
    }

}
