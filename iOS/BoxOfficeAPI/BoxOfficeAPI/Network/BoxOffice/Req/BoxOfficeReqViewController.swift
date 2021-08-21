//
//  BoxOfficeReqViewController.swift
//  BoxOfficeAPI
//
//  Created by 김수빈 on 2021/07/27.
//

import UIKit

class BoxOfficeReqViewController: BaseViewController {

    @IBOutlet weak var idLabel: UILabel!
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "영화 요청하기"
        idLabel.text = movie.movieNm    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func reqBoxButtonTapped(_ sender: Any) {
       // let input = BoxO
    }
    
}
