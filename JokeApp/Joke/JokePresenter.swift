//
//  JokePresenter.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation
import UIKit

protocol JokePresenterInput: AnyObject {}

class JokePresenter: ViperPresenter, JokePresenterInput {
    var viewInput: JokeViewInput!
    var interactorInput: JokeInteractorInput!
    var routerInput: JokeRouterInput!

    required init() {}
}

extension JokePresenter: JokeViewOuput {
    func viewDidLoad() {
        print("did load!!")
    }
    
    func view(didSelectRowAt indexPath: IndexPath) {
        //routerInput.displayJokeViewController(joke, jokeDetailOutput: self)
    }
}

extension JokePresenter: JokeInteractorOutput {
    
}

extension JokePresenter: JokeDetailModuleOutput {
    func module(_ view: UIViewController, didTapSaveButtonWith joke: Joke) {
            
    }
}
