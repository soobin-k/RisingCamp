//
//  CollectionViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/21.
//

import Foundation
import UIKit
import XLPagerTabStrip
import Alamofire
import SwiftyJSON
import SDWebImage

class CollectionViewController: UIViewController, IndicatorInfoProvider, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //받아온 데이터를 담을 변수를 생성
    
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    private var lists: [JSON] = []

    let url1 = "https://api.themoviedb.org/3/search/movie?api_key=12d1693e997e213480139d81b182e00d&query="
    let url2 = "&page=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegate = self -> 제스쳐, UI
        collectionView.delegate = self
        // DataSource = self -> 데이터관리
        collectionView.dataSource = self
        
        collectionView.reloadData()
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //getMovieList2()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "영화 검색")
    }
    /*
    func getMovieList2(){
        AF.request(url).responseJSON { [self] (response) in
            if var value = response.value{ // value가 옵셔널이 아니라면(값이 있다면) 변수를 대입해줘!
                var json = JSON(value)
                self.lists = json["results"].arrayValue //배열 값이다.
                //print(lists)
                self.collectionView.reloadData()
            }
            
        }
    }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 가져온 데이터 개수
        return lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else{
            return UICollectionViewCell()
        }
        
        //cell.cellMovieName.text = "\(indexPath.row)번째 데이터 입니다."
        let list = lists[indexPath.row]
        //print(list)
        //print(list["title"].stringValue)
        cell.cellMovieName.text = list["title"].stringValue
        //cell.cellMovieName.text = "tnqlqs"
        cell.cellMovieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + list["poster_path"].stringValue), completed: nil)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 3개가 딱 맞게 정사각형으로 들어가게!
        var width = self.collectionView.bounds.width / 3
        return CGSize(width: width, height: width*1.5)
    }

    @IBAction func btnSearch(_ sender: Any) {
        let searchitem = textSearch.text
        AF.request(url1 + searchitem! + url2).responseJSON { [self] (response) in
            if let value = response.value{ // value가 옵셔널이 아니라면(값이 있다면) 변수를 대입해줘!
                let json = JSON(value)
                self.lists = json["results"].arrayValue //배열 값이다.
                //print(lists)
                collectionView.reloadData()
            }
            
        }
    }
}
