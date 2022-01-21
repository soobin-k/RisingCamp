//
//  GameOverViewController.swift
//  MultiThreadGame
//
//  Created by 김수빈 on 2021/07/17.
//

import Foundation
import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var btnNewGame: UIButton!
    @IBOutlet weak var labelScore: UILabel!
    var score: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelScore.text = String(score)
        if(score>=10000){
            imageBackground.image = #imageLiteral(resourceName: "sucess")
        }
    }
    
    //화면 가로로 설정
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return .landscapeLeft
    }
    
    @IBAction func btnNewGame(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

