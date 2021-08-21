//
//  ViewController.swift
//  BoxOfficeAPI
//
//  Created by 김수빈 on 2021/07/27.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Network 메인"
    }

    @IBAction func btnNextVIew(_ sender: Any) {
        print("HI")
        self.navigationController?.pushViewController(BoxOfficeViewController(), animated: true)
    }
    
}

