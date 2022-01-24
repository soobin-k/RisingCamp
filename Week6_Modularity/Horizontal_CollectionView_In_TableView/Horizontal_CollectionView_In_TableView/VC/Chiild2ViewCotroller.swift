//
//  Chiild2ViewCotroller.swift
//  Horizontal_CollectionView_In_TableView
//
//  Created by 김수빈 on 2021/07/29.
//

import Foundation
import XLPagerTabStrip

class Chiild2ViewCotroller: UIViewController,IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "영화 예매")
    }
}
