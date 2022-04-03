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
    
    private var selectedIndex: Int = 0

    required init() {}
}

extension JokePresenter: JokeViewOuput {
    func view(didSelect joke: Joke, at indexPath: IndexPath) {
        routerInput.displayJokeViewController(joke, jokeDetailOutput: self)
        selectedIndex = indexPath.row
    }
    
    func viewDidLoad() {
        interactorInput.getJokes()
        viewInput.startLoading()
    }
}

extension JokePresenter: JokeInteractorOutput {
    func interactor(didGet jokes: Jokes) {
        viewInput.stopLoading()
        viewInput.displayJokes(jokes)
    }
}

extension JokePresenter: JokeDetailModuleOutput {
    func module(_ view: UIViewController, didTapSaveButtonWith joke: Joke) {
        viewInput.updateJoke(joke, at: selectedIndex)
        view.dismiss(animated: true, completion: nil)
    }
}
