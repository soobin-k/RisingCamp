//
//  MovieListCell.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/23.
//

import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet weak var movielListTitle: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let cellNib = UINib(nibName: "MovieSingleCell", bundle: nil)
                self.collectionView.register(cellNib, forCellWithReuseIdentifier: "MovieSingleCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MovieListCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieSingleCell", for: indexPath) as? MovieSingleCell {
            /*
            cell.tagListView.removeAllTags()
            cell.tagListView.addTags(["Tag1","Tag2","Tag3"])*/
            cell.movieImage.image = #imageLiteral(resourceName: "Play")
            cell.movieTitle.text = "hi"
            print(indexPath)
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
        
    }
    
}
