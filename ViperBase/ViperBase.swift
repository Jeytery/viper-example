//
//  ViperBase.swift
//  ViperBase
//
//  Created by Jeytery on 02.04.2022.
//

import UIKit

protocol ViperBase {
    init()
}

protocol ViperView: ViperBase {
    associatedtype ViewOutput
 
    var output: ViewOutput! { get set }
}

protocol ViperPresenter: ViperBase {
    associatedtype ViewInput
    associatedtype InteractorInput
    associatedtype RouterInput
    
    var viewInput: ViewInput! { get set }

    var interactorInput: InteractorInput! { get set }

    var routerInput: RouterInput! { get set }
}

protocol ViperInteractor: ViperBase {
   associatedtype InteractorOutput

   var output: InteractorOutput! { get set }
}

protocol ViperRouter: ViperBase {
    var viewController: UIViewController! { get set }
}

struct ViperModule<
    View:       UIViewController & ViperView,
    Presenter:  ViperPresenter,
    Interactor: ViperInteractor,
    Router:     ViperRouter
> {
    public let view: View

    public let presenter: Presenter
    
    public let interactor: Interactor
    
    public let router: Router
}

class ViperBuilder<
    View:       UIViewController & ViperView,
    Presenter:  ViperPresenter,
    Interactor: ViperInteractor,
    Router:     ViperRouter
> {
    static func build() -> ViperModule<
        View,
        Presenter,
        Interactor,
        Router
    > {
        var view: View = View()
        var presenter = Presenter()
        var interactor = Interactor()
        var router = Router()
        
        view.output = presenter as? View.ViewOutput
        presenter.viewInput = view as? Presenter.ViewInput
        presenter.routerInput = router as? Presenter.RouterInput
        presenter.interactorInput = interactor as? Presenter.InteractorInput
        interactor.output = presenter as? Interactor.InteractorOutput
        router.viewController = view
        
        return ViperModule(
            view: view,
            presenter: presenter,
            interactor: interactor,
            router: router
        )
    }
}
