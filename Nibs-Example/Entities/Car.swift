//
//  Car.swift
//  Sixt Task
//
//  Created by barbarity on 18/12/2017.
//  Copyright © 2017 Barbarity Software. All rights reserved.
//

import Foundation

struct Car: Codable {
    var id: String?
    var modelIdentifier: String?
    var modelName: String?
    var name: String?
    var make: String?
    var group: String?
    var color: String?
    var series: String?
    var fuelType: FuelType?
    var fuelLevel: Float?
    var transmission: TransmissionType?
    var licensePlate: String?
    var longitude: Double?
    var latitude: Double?
    var innerCleanliness: InnerCleanlinessType?
    
    enum FuelType: String, Codable {
        case P, D, E
    }
    
    enum TransmissionType: String, Codable {
        case M, A
    }
    
    enum InnerCleanlinessType: String, Codable {
        case regular = "REGULAR"
        case clean = "CLEAN"
        case veryclean = "VERY_CLEAN"
    }
    
    // NOTE: I normally assign enums to types that rarely change over time. I assumed these three don't change very often, but it could be implemented in other parameters.
}
