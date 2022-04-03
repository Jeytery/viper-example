//
//  API.swift
//  JokeApp
//
//  Created by Jeytery on 03.04.2022.
//

import Foundation

typealias ResultCompletion<ReturType, ErrorType: Error> = (Result<ReturType, ErrorType>) -> Void

class API {
    static func getJokes(completion: @escaping ResultCompletion<Jokes, Error>) {
        let jokes: Jokes = [
            .init(name: "Bear joke", body: "I love bear", id: "0"),
            .init(name: "Base programming joke", body: "Hello from world!", id: "1"),
            .init(name: "Language joke", body: "C# is better than C++", id: "2"),
            .init(name: "Absurd", body: "JS is the best programming language", id: "3"),
            .init(name: "I so love this architecture", body: "VIPER is a good architecture", id: "4"),
            .init(name: "My university joke", body: "KPI is the best place to learn code", id: "5"),
            .init(name: "SLAVA", body: "A-ME-RI-KA", id: "6"),
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(jokes))
        }
    }
}
