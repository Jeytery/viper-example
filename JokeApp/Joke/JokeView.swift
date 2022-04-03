//
//  JokeView.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation
import UIKit
import SnapKit

protocol JokeViewInput: AnyObject {
    func displayJokes(_ jokes: Jokes)
    
    func startLoading()
    func stopLoading()
    
    func updateJoke(_ joke: Joke, at index: Int)
}

protocol JokeViewOuput: AnyObject {
    func viewDidLoad()
    func view(didSelect joke: Joke, at indexPath: IndexPath)
}

class JokeView: UIViewController, ViperView {
    
    var output: JokeViewOuput!
    
    private var jokes = Jokes()
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let spinner = UIActivityIndicatorView()
    
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
        
        configureTableView()
        configureSpinner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension JokeView {
    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func configureSpinner() {
        view.addSubview(spinner)
        spinner.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        spinner.hidesWhenStopped = true
    }
}

extension JokeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return jokes.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let joke = jokes[indexPath.row]
        cell.textLabel?.text = joke.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let joke = jokes[indexPath.row]
        output?.view(didSelect: joke, at: indexPath)
    }
}

extension JokeView: JokeViewInput {
    func displayJokes(_ jokes: Jokes) {
        self.jokes = jokes
        tableView.reloadData()
    }
    
    func startLoading() {
        spinner.startAnimating()
    }
    
    func stopLoading() {
        spinner.stopAnimating()
    }
    
    func updateJoke(_ joke: Joke, at index: Int) {
        jokes.remove(at: index)
        jokes.insert(joke, at: index)
        tableView.reloadData()
    }
}
