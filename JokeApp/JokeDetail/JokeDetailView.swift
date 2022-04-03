//
//  JokeDetailView.swift
//  JokeApp
//
//  Created by Jeytery on 02.04.2022.
//

import UIKit

protocol JokeDetailViewInput: AnyObject {
    func setJoke(_ joke: Joke)
}

protocol JokeDetailViewOuput: AnyObject {
    func viewDidLoad()
    func view(_ view: UIViewController, didTapSaveButtonWith name: String, body: String)
}

class JokeDetailView: UIViewController, ViperView {

    var output: JokeDetailViewOuput!
    
    private let nameTextField = UITextField()
    private let bodyLabel = UILabel()
    private let saveButton = UIButton()
    
    private let stackView = UIStackView()
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .systemBackground
        self.view = view
        
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension JokeDetailView {
    func configureSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
        saveButton.backgroundColor = .systemBlue
    }
    
    @objc func saveButtonDidTap() {
        output?.view(self, didTapSaveButtonWith: nameTextField.text ?? "", body: bodyLabel.text ?? "")
    }
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        configureSaveButton()
        
        nameTextField.backgroundColor = .systemGray5
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(bodyLabel)
        stackView.addArrangedSubview(saveButton)
        
        nameTextField.text = "123"
        bodyLabel.text = "1234"
    }
}

extension JokeDetailView: JokeDetailViewInput {
    func setJoke(_ joke: Joke) {
        nameTextField.text = joke.name
        bodyLabel.text = joke.body
    }
}
