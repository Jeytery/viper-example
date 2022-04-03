//
//  JokeRouter.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation
import UIKit

protocol JokeRouterInput: AnyObject {
    func displayJokeViewController(_ joke: Joke, jokeDetailOutput: JokeDetailModuleOutput)
}

class JokeRouter: ViperRouter, JokeModuleOutput {
    var viewController: UIViewController!
    
    required init() {}
}

extension JokeRouter: JokeRouterInput {
    func displayJokeViewController(_ joke: Joke, jokeDetailOutput: JokeDetailModuleOutput) {
        let jokeView = JokeDetailBuilder.build(with: joke, delegate: jokeDetailOutput).view
        viewController.present(jokeView, animated: true, completion: nil)
    }
}
