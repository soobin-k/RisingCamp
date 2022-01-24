//
//  TransitionNextViewController.swift
//  ScreenTransitionEx
//
//  Created by 김수빈 on 2021/07/29.
//
import UIKit

class TransitionNextViewController: UIViewController {
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .yellow
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.backgroundColor = .green
    }*/
    
    // MARK: 네비게이션 컨트롤러를 이용한 뒤로가기
    @IBAction func navigationPopButtonTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: modal 내리기
    @IBAction func dismissModalButtonTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
