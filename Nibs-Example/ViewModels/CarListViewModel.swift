//
//  CarListViewModel.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import Foundation

class CarListViewModel {

    var numberOfCars: Int {
        return carList.count
    }

    private var carList = [Car]()
    private var carGateway: CarGateway

    init(_ carGateway: CarGateway) {
        self.carGateway = carGateway
    }

    func requestData( callback: @escaping (_ error: Error?)->() ) {
        carGateway.fetchCars { [weak self] (result) in
            switch result {
            case let .Success(cars):
                self?.carList.append(contentsOf: cars)
                callback(nil)
            case let .Failure(error):
                print(error) // handle the error here
            }
        }
    }


    func carCellViewModelForIndex(_ index: Int) -> CarCellViewModel? {
        guard carList.count > index else { return nil }
        let car = carList[index]
        return CarCellViewModel(carName: car.name ?? "", carInfo: String(format: "%@ %@", car.modelName ?? "", car.licensePlate ?? "") , imageUrl: car.carImageURL ?? "")
    }

}
