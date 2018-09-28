//
//  ResultType.swift
//  Sixt Task
//
//  Created by barbarity on 18/12/2017.
//  Copyright © 2017 Barbarity Software. All rights reserved.
//

import Foundation

enum ResultType<T> {
    case Success(T)
    case Failure(Error)
}

extension ResultType {
    func map<U>(f: (T)->U) -> ResultType<U> {
        switch self {
        case .Success(let t): return .Success(f(t))
        case .Failure(let err): return .Failure(err)
        }
    }
    func flatMap<U>(f: (T)->ResultType<U>) -> ResultType<U> {
        switch self {
        case .Success(let t): return f(t)
        case .Failure(let err): return .Failure(err)
        }
    }
}
