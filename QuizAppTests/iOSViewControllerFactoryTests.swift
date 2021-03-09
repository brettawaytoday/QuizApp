//
//  iOSViewControllerFactory.swift
//  QuizAppTests
//
//  Created by Brett Christian on 9/03/21.
//

import Foundation
import XCTest
import QuizEngine
@testable import QuizApp


class iOSViewControllerFactoryTests: XCTestCase {
    
    func test_questionViewController_createsControllerWithQuestion() {
        let question = Question.singleAnswer("Q1")
        let options = ["A1", "A2"]
        let sut = iOSViewControllerFactory(options: [question: options])
        
        let controller = sut.questionViewController(for: Question.singleAnswer("Q1"), answerCallback: { _ in }) as? QuestionViewController
        
        XCTAssertEqual(controller?.question, "Q1")
    }
    
    func test_questionViewController_createsControllerWithOptions() {
        let question = Question.singleAnswer("Q1")
        let options = ["A1", "A2"]
        let sut = iOSViewControllerFactory(options: [question: options])
        
        let controller = sut.questionViewController(for: Question.singleAnswer("Q1"), answerCallback: { _ in }) as? QuestionViewController
        
        XCTAssertEqual(controller?.options, options)
    }
}
