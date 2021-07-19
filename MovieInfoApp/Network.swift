//
//  Network.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/19.
//

import Foundation
import Alamofire
/*
class Network {
    let apiKey = "각자 발행된 API 키를 넣으면 됩니다."
    
    static let shared = Network()
    
    class var baseURL : String {
        return "https://api.thecatapi.com"
    }
    
    static var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [:]
        configuration.httpAdditionalHeaders?["Accept"] = "application/json"
        return Alamofire.SessionManager(configuration: configuration)
    }()
    

    func getRandomCatPicture(parameters : Parameters, completion : @escaping(_ result : Data) -> (Void)){
        let url = "/v1/images/search"
        let parameters : Parameters = parameters
        Network.sessionManager.request(Network.baseURL + url, method: .get, parameters:  parameters).responseJSON { (response) in
            switch response.result{
            case .success(_):
                completion(response.data!)
                break
            case .failure(let error):
                print(error)
                print(response.data!)
                break
            }
        }
    }
}
*/
