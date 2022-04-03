//
//  JokeDetailPresenter.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation

protocol JokeDetailPresenterInput: AnyObject {}
protocol JokeDetailPresenterOutput: AnyObject {}

protocol JokeModuleOutput: AnyObject {}

class JokeDetailPresenter: ViperPresenter, JokeDetailPresenterInput {
    var viewInput: JokeDetailViewInput!
    var interactorInput: JokeDetailInteractorInput!
    var routerInput: JokeDetailRouterInput!
    
    weak var moduleOuput: JokeModuleOutput?

    required init() {}
}

extension JokeDetailPresenter: JokeDetailViewOuput {
    func viewDidLoad() {
        print("did load!!")
    }
}

extension JokeDetailPresenter: JokeDetailInteractorOutput {}
