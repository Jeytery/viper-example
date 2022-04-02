//
//  JokeModule.swift
//  JokeApp
//
//  Created by Jeytery on 02.04.2022.
//

import UIKit

protocol JokeViewInput: AnyObject {}
protocol JokeViewOuput: AnyObject {
    func viewDidLoad()
}

class JokeView: UIViewController, ViperView, JokeViewInput {
    
    var output: JokeViewOuput!
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .cyan
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol JokePresenterInput: AnyObject {}
protocol JokePresenterOutput: AnyObject {}

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
}

extension JokePresenter: JokeInteractorOutput {
    
}

protocol JokeInteractorInput: AnyObject {}
protocol JokeInteractorOutput: AnyObject {}

class JokeInteractor: ViperInteractor, JokeInteractorInput {
    var output: JokeInteractorOutput!
    
    required init() {}
}

protocol JokeRouterInput: AnyObject {}

class JokeRouter: ViperRouter, JokeRouterInput {
    var viewController: UIViewController!
    
    required init() {
        
    }
}

typealias JokeBuilder = ViperBuilder<
    JokeView,
    JokePresenter,
    JokeInteractor,
    JokeRouter
>
