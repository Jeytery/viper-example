//
//  JokeDetailPresenter.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation
import UIKit

protocol JokeDetailPresenterInput: AnyObject {
    func setJoke(_ joke: Joke)
}

protocol JokeModuleOutput: AnyObject {}

class JokeDetailPresenter: ViperPresenter {
    
    var viewInput: JokeDetailViewInput!
    var interactorInput: JokeDetailInteractorInput!
    var routerInput: JokeDetailRouterInput!
    
    private var joke: Joke!
    
    weak var moduleOuput: JokeDetailModuleOutput?

    required init() {}
}

extension JokeDetailPresenter: JokeDetailViewOuput {
    func view(_ view: UIViewController, didTapSaveButtonWith name: String, body: String) {
        let joke = Joke(name: name, body: body, id: self.joke.id)
        moduleOuput?.module(view, didTapSaveButtonWith: joke)
    }
    
    func viewDidLoad() {
        viewInput.setJoke(joke)
    }
}

extension JokeDetailPresenter: JokeDetailInteractorOutput {}

extension JokeDetailPresenter: JokeDetailPresenterInput {
    func setJoke(_ joke: Joke) {
        self.joke = joke
    }
}
