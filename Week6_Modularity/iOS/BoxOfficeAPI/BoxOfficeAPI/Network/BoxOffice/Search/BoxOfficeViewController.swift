//
//  BoxOfficeViewController.swift
//  BoxOfficeAPI
//
//  Created by 김수빈 on 2021/07/27.
//

import UIKit

class BoxOfficeViewController: BaseViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Title
        self.navigationItem.title = "아이디로 친구 검색"
        
        // DisMiss Keyboard When Tapped Around
        self.dismissKeyboardWhenTappedAround()
        
        // Table View
        tableView.delegate = self
        tableView.dataSource = self
    }


    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let date = idTextField.text?.trim, date.isExists else{
            self.presentAlert(title: "데이터를 입력해주세요.")
            return
        }
        //로딩중
        showIndicator()
        BoxOfficeDataManager().searchDailyBoxOfficeList(targetDt: date, delegate: self)
    }
    

}
extension BoxOfficeViewController {
    func didRetrieveBoxOffice(result: BoxOfficeResult) {
        dismissIndicator()
        movies = result.dailyBoxOfficeList
        tableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        dismissIndicator()
        presentAlert(title: message)
    }
}
extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let movie = movies[indexPath.row]
        cell.textLabel?.text =  "\(movie.rank). \(String(movie.audiCnt).insertComma)명"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let movie = movies[indexPath.row]
        let movieReqVC = BoxOfficeReqViewController()
        movieReqVC.movie = movie
        self.navigationController?.pushViewController(movieReqVC, animated: true)
    }
}
