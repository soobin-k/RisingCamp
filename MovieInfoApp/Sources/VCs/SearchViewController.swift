//
//  SearchViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/20.
//

import Foundation
import UIKit
import XLPagerTabStrip

class SearchViewController: UIViewController, IndicatorInfoProvider {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let UserVO = UserVO.shared
        userName.text = UserVO.userName + "님"
        userImage.image = UserVO.userImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Two")
    }

}
