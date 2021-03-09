//
//  ViewControllerFactory.swift
//  QuizApp
//
//  Created by Brett Christian on 9/03/21.
//

import UIKit
import QuizEngine


protocol ViewControllerFactory {
    func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController
    
    func resultViewController(for result: Result<Question<String>, [String]>) -> UIViewController
}
