//
//  ResultHelper.swift
//  QuizAppTests
//
//  Created by Brett Christian on 10/03/21.
//

@testable import QuizEngine

extension Result {
    static func make(answers: [Question: Answer] = [:], score: Int = 0) -> Result<Question, Answer> {
        return Result(answers: answers, score: score)
    }
}

extension Result: Equatable where Answer: Equatable {
    public static func == (lhs: Result<Question, Answer>, rhs: Result<Question, Answer>) -> Bool {
        return lhs.score == rhs.score && lhs.answers == rhs.answers
    }
}

extension Result: Hashable where Answer: Equatable {
    ///Method to silence the hashValue Depricated warning.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(score)
    }
    
    public var hashValue: Int {
        var hasher = Hasher()
        hasher.combine(score)
        return hasher.finalize()
    }
}
