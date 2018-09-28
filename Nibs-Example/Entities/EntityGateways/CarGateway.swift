//
//  CarGateway.swift
//  Sixt Task
//
//  Created by barbarity on 18/12/2017.
//  Copyright © 2017 Barbarity Software. All rights reserved.
//

import Foundation

protocol CarGateway {
    func fetchCars(completionHandler: @escaping (ResultType<[Car]>) -> Void)
    func fetchImage(imageURL: String, completionHandler: @escaping (ResultType<Data>) -> Void)
}
