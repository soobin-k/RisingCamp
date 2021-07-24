//
//  SearchViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/20.
//

import Foundation
import UIKit
import XLPagerTabStrip

class SearchViewController: UIViewController, IndicatorInfoProvider{
    var bookVO = BookVO.shared
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegate = self -> 제스쳐, UI
        tableView.delegate = self
        // DataSource = self -> 데이터관리
        tableView.dataSource = self
        
        tableView.reloadData()
        
        let UserVO = UserVO.shared
        userName.text = UserVO.userName + "님"
        userImage.image = UserVO.userImage
        
        //이미지 원형으로 만들기
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.layer.borderWidth = 1
        userImage.clipsToBounds = true
        userImage.layer.borderColor = UIColor.clear.cgColor  //원형 이미지의 테두리 제거
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        bookVO = BookVO.shared
        tableView.reloadData()
        print("appear")
        print(bookVO.movieTitle.count)
        print(bookVO.movieTitle)
        print(bookVO.movieDate)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "마이페이지")
    }

}
extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookVO.movieTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as? BookCell else{
            return UITableViewCell()
        }
        cell.movieDate.text = bookVO.movieDate[indexPath.row]
        cell.movieTitle.text = bookVO.movieTitle[indexPath.row]
        return cell
    }
}

