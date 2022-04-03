//
//  JokeInteractor.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation

protocol JokeInteractorInput: AnyObject {}
protocol JokeInteractorOutput: AnyObject {}

class JokeInteractor: ViperInteractor, JokeInteractorInput {
    var output: JokeInteractorOutput!
    
    required init() {}
}
