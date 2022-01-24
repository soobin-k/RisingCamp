//
//  BaseViewController.swift
//  EduTemplate - storyboard
//
//  Created by Zero Yoon on 2022/02/23.
//
// MARK: 모든 뷰 컨트롤러에서 공통 적용되는 부분, 새로운 뷰 컨트롤러 만들 때 마다 UIViewController 대신 상속하기!
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 아래 예시들처럼 상황에 맞게 활용하시면 됩니다.
        // Navigation Bar
    //self.navigationController?.navigationBar.titleTextAttributes = [ .font : UIFont.NotoSans(.medium, size: 16),]
        // Background Color
    self.view.backgroundColor = .white
    }
}
