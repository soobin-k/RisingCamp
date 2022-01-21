//
//  BoxOfficeDataManager.swift
//  BoxOfficeAPI
//
//  Created by 김수빈 on 2021/07/27.
//

import Alamofire
//네트워크 통신만 담당
class BoxOfficeDataManager {
    func searchDailyBoxOfficeList(targetDt: String, delegate: BoxOfficeViewController) {
        let url = "\(Constant.KOBIS_BASE_URL)/boxoffice/searchDailyBoxOfficeList.json"
            + "?key=\(KobisKey.DAILY_BOXOFFICE_KEY)"
            + "&targetDt=\(targetDt)"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: BoxOfficeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    //테이블 값 갱신
                    delegate.didRetrieveBoxOffice(result: response.boxOfficeResult)
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
