//
//  JokeDetailModule.swift
//  JokeApp
//
//  Created by Jeytery on 02.04.2022.
//

import UIKit

protocol JokeDetailModuleOutput: AnyObject {
    func module(_ view: UIViewController, didTapSaveButtonWith joke: Joke)
}

class JokeDetailBuilder: ViperBuilder<
    JokeDetailView,
    JokeDetailPresenter,
    JokeDetailInteractor,
    JokeDetailRouter
> {
    static func build(
        with joke: Joke,
        delegate: JokeDetailModuleOutput
    ) -> ViperModule<
        JokeDetailView,
        JokeDetailPresenter,
        JokeDetailInteractor,
        JokeDetailRouter
    > {
        let view = JokeDetailView()
        let presenter = JokeDetailPresenter()
        let interactor = JokeDetailInteractor()
        let router = JokeDetailRouter()
        
        view.output = presenter as JokeDetailView.ViewOutput
        
        presenter.viewInput = view as JokeDetailPresenter.ViewInput
        presenter.routerInput = router as JokeDetailPresenter.RouterInput
        presenter.interactorInput = interactor as JokeDetailPresenter.InteractorInput
        presenter.moduleOuput = delegate
        presenter.setJoke(joke)
        
        interactor.output = presenter as JokeDetailInteractor.InteractorOutput
        router.viewController = view
        
        return ViperModule(
            view: view,
            presenter: presenter,
            interactor: interactor,
            router: router
        )
    }
}
