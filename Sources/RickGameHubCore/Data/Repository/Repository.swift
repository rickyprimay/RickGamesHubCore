//
//  Repository.swift
//  RickGameHubCore
//
//  Created by Ricky Primayuda Putra on 29/12/24.
//

import Combine

public protocol Repository {
    associatedtype Request
    associatedtype Response
    
    func executePublisher(request: Request) -> AnyPublisher<Response, Error>
    func executeFuture(request: Request) -> Future<Response, Error>
}

public extension Repository {
    func executePublisher(request: Request) -> AnyPublisher<Response, Error> {
        // Default implementation: return an empty publisher
        return Empty<Response, Error>().eraseToAnyPublisher()
    }
    
    func executeFuture(request: Request) -> Future<Response, Error> {
        // Default implementation: return a Future with a placeholder Response
        return Future { promise in
            // Example implementation: You may want to customize this
            promise(.failure(NSError(domain: "DefaultFutureError", code: -1, userInfo: nil)))
        }
    }
}
