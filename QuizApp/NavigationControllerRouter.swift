//
//  NavigationControllerRouter.swift
//  QuizApp
//
//  Created by Brett Christian on 24/02/21.
//

protocol ViewControllerFactory {
    func questionViewController( for question: String, answerCallback: @escaping (String) -> Void) -> UIViewController
}

import UIKit
import QuizEngine

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        let viewController = factory.questionViewController(for: question, answerCallback: answerCallback)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeTo(result: Result<String, String>) {
        
    }
}
