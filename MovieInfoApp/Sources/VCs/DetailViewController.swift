//
//  DetailViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/24.
//

import Foundation
import UIKit
import SwiftyJSON
class DetailViewController: UIViewController{
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieStar: UILabel!
    
    let movieVO = MovieVO.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        let index = movieVO.index
        movieTitle.text = movieVO.nowPlaying[index]["title"].stringValue
        movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + movieVO.nowPlaying[index]["poster_path"].stringValue), completed: nil)
        movieRelease.text = "출시일: " + movieVO.nowPlaying[index]["release_date"].stringValue
        movieOverview.text = movieVO.nowPlaying[index]["overview"].stringValue
        movieStar.text = "별점: " + movieVO.nowPlaying[index]["vote_average"].stringValue + " / 10 점"
    }
    @IBAction func btnBook(_ sender: Any) {
       // print(self.movie)
    }
}

