//
//  JokeDetailRouter.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import UIKit

protocol JokeDetailRouterInput: AnyObject {}

class JokeDetailRouter: ViperRouter, JokeDetailRouterInput {
    
    var viewController: UIViewController!
    
    required init() {
        
    }
}
