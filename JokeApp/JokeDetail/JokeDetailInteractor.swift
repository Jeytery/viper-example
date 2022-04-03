//
//  JokeDetailInteractor.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation

protocol JokeDetailInteractorInput: AnyObject {}
protocol JokeDetailInteractorOutput: AnyObject {}

class JokeDetailInteractor: ViperInteractor, JokeDetailInteractorInput {
    var output: JokeDetailInteractorOutput!
    
    required init() {}
}
