//
//  JokeDetailView.swift
//  JokeApp
//
//  Created by Jeytery on 02.04.2022.
//

import UIKit

protocol JokeDetailViewInput: AnyObject {}

protocol JokeDetailViewOuput: AnyObject {
    func viewDidLoad()
}

class JokeDetailView: UIViewController, ViperView, JokeViewInput {
    
    var output: JokeDetailViewOuput!
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .red
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
