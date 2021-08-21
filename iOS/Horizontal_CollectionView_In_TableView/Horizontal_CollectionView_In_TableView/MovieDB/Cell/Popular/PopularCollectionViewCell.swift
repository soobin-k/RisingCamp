//
//  PopularCollectionViewCell.swift
//  Horizontal_CollectionView_In_TableView
//
//  Created by 김수빈 on 2021/07/29.
//

import UIKit
import SDWebImage

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(movie: Movie) {
        self.movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + movie.poster_path!), completed: nil)
        self.movieTitle.text = movie.title
        print(movie.title)
    }
}
