//
//  MovieDBDataManager.swift
//  Horizontal_CollectionView_In_TableView
//
//  Created by 김수빈 on 2021/07/30.
//

import Alamofire

class MovieDBDataManager {
    func searchMovieDBList(targetDt: String, delegate: MovieListViewController){
        
        //API url
        let url = "\(Constant.MOVIE_BASE_URL)/\(targetDt)" + "?api_key=\(MovieDBKey.MOVIE_DB_KEY)" + "&language=ko-KR&page=1"
        //let url = "https://api.themoviedb.org/3/movie/popular?api_key=12d1693e997e213480139d81b182e00d&language=ko-KR&page=1"
        //Request
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: MovieDBResponse.self) { response in
                switch response.result {
                case .success(let response):
                    delegate.didRetrieveBoxOffice(result: response.results)
                    print("success")
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                    print("fail")
                }
            }
    }
}
