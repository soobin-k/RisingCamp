//
//  MainViewController.swift
//  TopTapBar
//
//  Created by 김수빈 on 2021/07/28.
//

import UIKit
import XLPagerTabStrip

class MainViewController: UIViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "상단 탭바")
      }
}
