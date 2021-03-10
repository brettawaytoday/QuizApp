//
//  Question.swift
//  QuizApp
//
//  Created by Brett Christian on 8/03/21.
//

//import Foundation
//
//enum Question<T: Hashable> : Hashable {
//    case singleAnswer(T)
//    case multipleAnswer(T)
//    
//    ///Method to silence the hashValue Depricated warning.
//    func hash(into hasher: inout Hasher) {}
//    
//    var hashValue: Int {
//        switch self {
//        case .singleAnswer(let value):
//            return value.hashValue
//        case .multipleAnswer(let value):
//            return value.hashValue
//        }
//    }
//    
//    static func == (lhs: Question<T>, rhs: Question) -> Bool {
//        switch (lhs, rhs) {
//        case (.singleAnswer(let a), .singleAnswer(let b)):
//            return a == b
//        case (.multipleAnswer(let a), .multipleAnswer(let b)):
//            return a == b
//        default:
//            return false
//        }
//    }
//}
