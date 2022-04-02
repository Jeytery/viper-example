//
//  JokeDetailModule.swift
//  JokeApp
//
//  Created by Jeytery on 02.04.2022.
//

import UIKit

protocol JokeDeatilPresenterInput: AnyObject {}
protocol JokeDeatilPresenterOutput: AnyObject {}

class JokeDeatilPresenter: ViperPresenter, JokeDeatilPresenterInput {
    var viewInput: JokeDeatilViewInput!
    var interactorInput: JokeDeatilInteractorInput!
    var routerInput: JokeDeatilRouterInput!

    required init() {}
}

extension JokeDeatilPresenter: JokeDeatilViewOuput {
    func viewDidLoad() {
        print("did load!!")
    }
}

extension JokeDeatilPresenter: JokeDeatilInteractorOutput {}

protocol JokeDeatilInteractorInput: AnyObject {}
protocol JokeDeatilInteractorOutput: AnyObject {}

class JokeDeatilInteractor: ViperInteractor, JokeDeatilInteractorInput {
    var output: JokeDeatilInteractorOutput!
    
    required init() {}
}

protocol JokeDeatilRouterInput: AnyObject {}

class JokeDeatilRouter: ViperRouter, JokeDeatilRouterInput {
    var viewController: UIViewController!
    
    required init() {
        
    }
}

typealias JokeDeatilBuilder = ViperBuilder<
    JokeDeatilView,
    JokeDeatilPresenter,
    JokeDeatilInteractor,
    JokeDeatilRouter
>
