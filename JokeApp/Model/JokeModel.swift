//
//  JokeModel.swift
//  JokeApp
//
//  Created by Jeytery on 02.04.2022.
//

import Foundation

struct Joke {
    let name: String
    let body: String
    let id: String
}

typealias Jokes = [Joke]

struct JokeDetail {
    let description: String
    let date: String
    let history: String
}

typealias JokeDetails = [JokeDetail]

