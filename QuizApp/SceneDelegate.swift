//
//  SceneDelegate.swift
//  QuizApp
//
//  Created by Brett Christian on 28/01/21.
//

import UIKit
import QuizEngine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var game: Game<Question<String>, [String], NavigationControllerRouter>?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
    }
    
    private func makeRootViewController() -> UINavigationController {
        let question1 = Question.singleAnswer("Where was Brett born?")
        
        let option1 = "South Africa"
        let option2 = "Zimbabwe"
        let option3 = "Botswana"
        let options1 = [option1, option2, option3]
        
        let question2 = Question.multipleAnswer("Which countries has Brett lived in?")
        
        let option4 = "Russia"
        let option5 = "Zimbabwe"
        let option6 = "Georgia"
        let option7 = "Botswana"
        let option8 = "South Africa"
        let option9 = "England"
        let options2 = [option4, option5, option6, option7, option8, option9]
        
        let questions = [question1, question2]
        
        let correctAnswers = [question1: [option2], question2: [option5, option6, option7, option8]]
        
        let navigationController = UINavigationController()
        let factory = iOSViewControllerFactory(questions: questions, options: [question1: options1, question2: options2], correctAnswers: correctAnswers)
        let router = NavigationControllerRouter(navigationController, factory: factory)
        
        game = startGame(questions: questions, router: router, correctAnswers: correctAnswers)
        return navigationController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

