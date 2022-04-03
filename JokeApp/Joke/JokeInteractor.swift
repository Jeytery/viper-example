//
//  JokeInteractor.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation

protocol JokeInteractorInput: AnyObject {
    func getJokes()
}
protocol JokeInteractorOutput: AnyObject {
    func interactor(didGet jokes: Jokes)
}

class JokeInteractor: ViperInteractor {
    var output: JokeInteractorOutput!
    
    required init() {}
}

extension JokeInteractor: JokeInteractorInput {
    func getJokes() {
        API.getJokes() {
            [weak output] result in
            switch result {
            case .success(let jokes):
                output?.interactor(didGet: jokes)
                break
            case .failure: break
            }
        }
    }
}
