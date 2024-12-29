//
//  Mapper.swift
//  RickGameHubCore
//
//  Created by Ricky Primayuda Putra on 29/12/24.
//

public protocol Mapper {
    associatedtype Responses
    associatedtype Models
    
    func mapResponsesToModels(responses: Responses) -> Models
}
