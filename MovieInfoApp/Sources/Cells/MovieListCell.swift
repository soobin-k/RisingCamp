//
//  MovieListCell.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/23.
//

import UIKit
import MSPeekCollectionViewDelegateImplementation
import SDWebImage
import Alamofire
import SwiftyJSON

class MovieListCell: UITableViewCell {
    @IBOutlet weak var movielListTitle: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let behavior = MSCollectionViewPeekingBehavior()
    private var lists: [JSON] = []
    let movieVO = MovieVO.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
       
        let cellNib = UINib(nibName: "MovieSingleCell", bundle: nil)
                self.collectionView.register(cellNib, forCellWithReuseIdentifier: "MovieSingleCell")
        
        behavior.cellSpacing = 8
        behavior.cellPeekWidth = 17
        behavior.numberOfItemsToShow = 2
        collectionView.configureForPeekingBehavior(behavior: behavior)
        
        //getMovieList()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MovieListCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieVO.upComing.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieSingleCell", for: indexPath) as? MovieSingleCell {
            /*
            cell.tagListView.removeAllTags()
            cell.tagListView.addTags(["Tag1","Tag2","Tag3"])*/
           
            cell.movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + movieVO.upComing[indexPath[1]]["poster_path"].stringValue), completed: nil)
                cell.movieTitle.text = movieVO.upComing[indexPath[1]]["title"].stringValue
            print("영화 제목" + cell.movieTitle.text!)
            
            
            cell.movieImage.layer.cornerRadius = 10
            //print(indexPath[0])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
                let cell = collectionView.cellForItem(at: indexPath) as? MovieSingleCell
                self.imageView?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)*/
        print("콜렉션 뷰 " + String(indexPath.row))
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    /*
    func getMovieList(){
        AF.request(url).responseJSON { [self] (response) in
            if let value = response.value{ // value가 옵셔널이 아니라면(값이 있다면) 변수를 대입해줘!
                let json = JSON(value)
                self.lists = json["results"].arrayValue //배열 값이다.
                //print(lists)
                
                movieVO.upComing = lists
                
            }
            
        }
        collectionView.reloadData()
    }*/
}
