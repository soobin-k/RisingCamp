//
//  ViewController.swift
//  OrderApp
//
//  Created by 김수빈 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Prperty
    
    @IBOutlet weak var ad: UIImageView!
    
    //MARK: - Lifecycle
    
    // 어디엔가 로드 메모리
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nameArray = MySingleton.shared.nameArray
        print("\(nameArray)")
        
    }

    // "뷰가 나타날 것이다."
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG VC1 >> \(#function) ")
        
        ad.image = [#imageLiteral(resourceName: "ad1"),#imageLiteral(resourceName: "ad2"),#imageLiteral(resourceName: "ad3"),#imageLiteral(resourceName: "ad4")].randomElement()
    }
    
    // "뷰가 나타났다."
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DEBUG VC1 >> \(#function) ")
    }
    
    // "뷰가 사라질 것이다."
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("DEBUG VC1 >> \(#function) ")
    }
    
    // "뷰가 사라졌다."
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("DEBUG VC1 >> \(#function) ")
    }
    
    //MARK: - Action
    @IBAction func btnClick(_ sender: Any) {
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        vc.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc, animated: true)
    }
    
}


