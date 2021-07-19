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

class ListViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    private var lists: [JSON] = []
    let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=12d1693e997e213480139d81b182e00d&language=ko-KR&page=1"
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        // Delegate = self -> 제스쳐, UI
        tableView.delegate = self
        // DataSource = self -> 데이터관리
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMovieList2()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(String(lists.count) + " 줄")
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else{
            return UITableViewCell()
        }
        
        //cell.cellMovieName.text = "\(indexPath.row)번째 데이터 입니다."
        //let list = lists[indexPath.row]
        //print(list)
        //print(list["title"].stringValue)
        //cell.cellMovieName.text = list["title"].stringValue
        cell.cellMovieName.text = "tnqlqs"
        cell.cellMovieImage.image = #imageLiteral(resourceName: "Play")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row) 입니다.")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    /*
    func getMovieList(){
        AF.request(url, method: .get,
                           parameters: nil,
                           encoding: URLEncoding.default,
                           headers: ["Content-Type":"application/json", "Accept":"application/json"])
                    .validate(statusCode: 200..<300)
                    .responseJSON { (json) in
                        //여기서 가져온 데이터를 자유롭게 활용하세요.
                        print(json)
        }
    }*/
    
    func getMovieList2(){
        AF.request(url).responseJSON { [self] (response) in
            if var value = response.value{ // value가 옵셔널이 아니라면(값이 있다면) 변수를 대입해줘!
                var json = JSON(value)
                self.lists = json["results"].arrayValue //배열 값이다.
                //print(lists)
                self.tableView.reloadData()
            }
            
        }
    }
}
