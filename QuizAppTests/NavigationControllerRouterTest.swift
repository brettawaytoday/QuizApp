//
//  NavigationControllerRouterTest.swift
//  QuizAppTests
//
//  Created by Brett Christian on 24/02/21.
//

import UIKit
import XCTest
import QuizEngine
@testable import QuizApp

class NavigationControllerRouterTest: XCTestCase {
    
    func test_routeToQuestion_presentsQuestionController() {
        let navigationController = UINavigationController()
        let factory = ViewControllerFactoryStub()
        let viewController = UIViewController()
        factory.stub(question: "Q1", with: viewController)
        
        let sut = NavigationControllerRouter(navigationController, factory: factory)
        
        sut.routeTo(question: "Q1", answerCallback: { _ in })
        
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    class ViewControllerFactoryStub: ViewControllerFactory {
        
        private var stubbedQuestions = [String: UIViewController]()
        
        func stub(question: String, with viewController: UIViewController) {
            stubbedQuestions[question] = viewController
        }
        
        func questionViewController(for question: String, answerCallback: (String) -> Void) -> UIViewController {
            return stubbedQuestions[question]!
        }
    }
}
