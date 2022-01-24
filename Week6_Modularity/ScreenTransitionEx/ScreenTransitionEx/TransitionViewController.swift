//
//  TransitionViewController.swift
//  ScreenTransitionEx
//
//  Created by 김수빈 on 2021/07/29.
//

import UIKit

class TransitionViewController: UIViewController {
    
    // MARK: RootViewController로 이동
    @IBAction func changeRootViewControllerButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
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
        let newStoryboard = UIStoryboard(name: "NewStoryboard", bundle: nil)
        let newViewController = newStoryboard.instantiateViewController(identifier: "NewViewController")
        self.changeRootViewController(newViewController)
    }
    
}
