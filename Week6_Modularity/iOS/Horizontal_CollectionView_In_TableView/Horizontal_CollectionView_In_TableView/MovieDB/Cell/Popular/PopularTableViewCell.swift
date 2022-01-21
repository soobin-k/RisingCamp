//
//  PopularTableViewCell.swift
//  Horizontal_CollectionView_In_TableView
//
//  Created by 김수빈 on 2021/07/29.
//

import Foundation
import UIKit
import MSPeekCollectionViewDelegateImplementation
import SDWebImage
import Alamofire

//MARK: 프로토콜 생성
protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: PopularCollectionViewCell?, index: Int, didTappedInTableViewCell: PopularTableViewCell)
}

class PopularTableViewCell: UITableViewCell {

    var movies: [Movie] = []
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //스크롤 action
    let behavior = MSCollectionViewPeekingBehavior()
    
    //프로토콜
    weak var cellDelegate: CollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let cellNib = UINib(nibName: "PopularCollectionViewCell", bundle: nil)
                self.collectionView.register(cellNib, forCellWithReuseIdentifier: "PopularCollectionViewCell")
        
        behavior.cellSpacing = 8
        behavior.cellPeekWidth = 17
        behavior.numberOfItemsToShow = 2
        collectionView.configureForPeekingBehavior(behavior: behavior)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//MARK: 테이블 뷰 셀 extension
extension PopularTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
        //return movieVO.popular.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? PopularCollectionViewCell {
            /*
            cell.movieImage.image = #imageLiteral(resourceName: "Play")
            cell.movieTitle.text = "영화"
            /*
            cell.movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + movieVO.popular[indexPath[1]]["poster_path"].stringValue), completed: nil)
                    cell.movieTitle.text = movieVO.popular[indexPath[1]]["title"].stringValue
            */
            //print("영화 제목" + cell.movieTitle.text!)
            
            cell.movieImage.layer.cornerRadius = 10*/
            cell.setCell(movie: movies[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        let cell = collectionView.cellForItem(at: indexPath) as? PopularCollectionViewCell
            self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //스크롤뷰
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    //데이터 가져올 함수
    func setCell(row: [Movie])  {
        self.movies = row
        self.collectionView.reloadData()
    }
}
