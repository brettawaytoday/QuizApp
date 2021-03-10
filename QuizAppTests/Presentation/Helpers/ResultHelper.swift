//
//  ResultHelper.swift
//  QuizAppTests
//
//  Created by Brett Christian on 10/03/21.
//

import QuizEngine


extension Result: Hashable {
    
    ///Method to silence the hashValue Depricated warning.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(score)
    }
    
    public var hashValue: Int {
        var hasher = Hasher()
        hasher.combine(score)
        return hasher.finalize()
    }
    
    public static func == (lhs: Result<Question, Answer>, rhs: Result<Question, Answer>) -> Bool {
        return lhs.score == rhs.score
    }
}
