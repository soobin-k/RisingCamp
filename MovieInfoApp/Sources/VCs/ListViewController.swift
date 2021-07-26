//
//  ListViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/19.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import XLPagerTabStrip

class ListViewController: UIViewController, IndicatorInfoProvider, UICollectionViewDelegate, CollectionViewCellDelegate{
    func collectionView(collectionviewcell: MovieSingleCell?, index: Int, didTappedInTableViewCell: MovieListCell) {
        print("어쩌구")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        tableView.reloadData()
        
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "영화 목록")
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell") as? MovieListCell else{
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.movielListTitle.text = "Upcoming"
            break
        case 1:
            cell.movielListTitle.text = "Now playing"
            break
        case 2:
            cell.movielListTitle.text = "Popular"
            break
        case 3:
            cell.movielListTitle.text = "Top Rated"
            break
        default:
            print("없음")
            break
        }
        //cell.movielListTitle.text = "인기"
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row) 입니다.")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 282
    }
    
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
            // #1
            let curatingCellNib = UINib(nibName: "MovieListCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "MovieListCell")
            // #2 #3
        /*
            let newsLetterCellNib = UINib(nibName: "NewsLetterCell", bundle: nil)
            self.tableView.register(newsLetterCellNib, forCellReuseIdentifier: "NewsLetterCell")
            // #4
            let categoryCellNib = UINib(nibName: "CategoryCell", bundle: nil)
            self.tableView.register(categoryCellNib, forCellReuseIdentifier: "CategoryCell")*/
    }
    
}
