//
//  BaseTapBarController.swift
//  EduTemplate
//
//  Created by 김수빈 on 2021/07/25.
//

import Foundation
import UIKit

class BaseTapBarController: UITabBarController, UITabBarControllerDelegate {
    let actionViewController = ActionViewController()
    //let networkViewController = NetworkMainViewController
    
    let actionTapBarItem = UITabBarItem(title: "Action", image: nil, tag: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionNetworkController = UINavigationController(rootViewController: actionViewController)
        actionNetworkController.tabBarItem = actionTapBarItem
        
        self.viewControllers = [actionNetworkController]
        self.delegate = self
    }
}
