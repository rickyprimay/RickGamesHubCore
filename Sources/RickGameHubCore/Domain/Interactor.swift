//
//  Interactor.swift
//  RickGameHubCore
//
//  Created by Ricky Primayuda Putra on 29/12/24.
//

import Combine

open class Interactor<Request, Response, R: Repository>: UseCase
where R.Request == Request, R.Response == Response {
    private let repository: R
    
    public init(repository: R) {
        self.repository = repository
    }
}

public extension Interactor {
    func executePublisher(request: Request) -> AnyPublisher<Response, Error> {
        return repository.executePublisher(request: request)
    }
    
    func executeFuture(request: Request) -> Future<Response, Error> {
        return repository.executeFuture(request: request)
    }
}
