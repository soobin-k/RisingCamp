//
//  TopTapBarViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/20.
//

import Foundation
import UIKit
import XLPagerTabStrip

class TopTabBarViewController: ButtonBarPagerTabStripViewController{
    
    override func viewDidLoad() {
            configureButtonBar()
            super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    func configureButtonBar() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white

        settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 16.0)!
        settings.style.buttonBarItemTitleColor = .gray
        
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0

        settings.style.selectedBarHeight = 3.0
        settings.style.selectedBarBackgroundColor = .systemPink
        
        // Changing item text color on swipe
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = .systemPink
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        
        let child1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        //child1.childNumber = "One"
        
        let child2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        //child2.childNumber = "Two"
        
        return [child1, child2]
    }
}
