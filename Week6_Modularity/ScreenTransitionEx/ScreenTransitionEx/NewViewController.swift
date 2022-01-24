//
//  NewViewController.swift
//  ScreenTransitionEx
//
//  Created by 김수빈 on 2021/07/29.
//

import Foundation
import UIKit

class NewViewController: UIViewController {
    
    // MARK: UIWindow의 rootViewController를 변경하여 화면전환
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    // MARK: 새로운 window로 화면전환
    @IBAction func changeWindowButtonTocuhUpInside(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: "ViewController")
        self.changeRootViewController(viewController)
        
    }
}
