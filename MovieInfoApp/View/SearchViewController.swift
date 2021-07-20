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


    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Two")
    }

}
