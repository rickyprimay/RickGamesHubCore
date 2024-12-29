//
//  DataSource.swift
//  RickGameHubCore
//
//  Created by Ricky Primayuda Putra on 29/12/24.
//

import Combine
import Foundation

public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func executePublisher(request: Request) -> AnyPublisher<Response, Error>
    func executeFuture(request: Request) -> Future<Response, Error>
}

public extension DataSource {
    func executePublisher(request: Request) -> AnyPublisher<Response, Error> {
        return Empty<Response, Error>().eraseToAnyPublisher()
    }
    
    func executeFuture(request: Request) -> Future<Response, Error> {
        return Future { promise in
            promise(.failure(NSError(domain: "DefaultDataSourceFutureError", code: -1, userInfo: nil)))
        }
    }
}
