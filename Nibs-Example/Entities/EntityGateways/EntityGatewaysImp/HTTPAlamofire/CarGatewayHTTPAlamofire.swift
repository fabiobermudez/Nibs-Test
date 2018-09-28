//
//  CarGatewayHTTPAlamofire.swift
//  Sixt Task
//
//  Created by barbarity on 18/12/2017.
//  Copyright © 2017 Barbarity Software. All rights reserved.
//

import Foundation
import Alamofire

class CarGatewayHTTPAlamofire: CarGateway {
    func fetchCars(completionHandler: @escaping (ResultType<[Car]>) -> Void) {
        Alamofire.request("http://www.codetalk.de/cars.json")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode([Car].self, from: response.data!)
                        completionHandler(.Success(result))
                    } catch {
                        completionHandler(.Failure(error))
                    }
                case .failure(let error):
                    completionHandler(.Failure(error))
                }
        }
    }
    
    func fetchImage(imageURL: String, completionHandler: @escaping (ResultType<Data>) -> Void) {
        Alamofire.request(imageURL)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["image/png"])
            .responseData { response in
                switch response.result {
                case .success:
                    completionHandler(.Success(response.data!))
                case .failure(let error):
                    completionHandler(.Failure(error))
                }
        }
    }
}
