//
//  MovieVO.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/20.
//

import Foundation
import UIKit
import SwiftyJSON

//영화 리스트
class MovieVO :NSObject{
  static let shared = MovieVO()
  var upComing: [JSON] = [] // 개봉 예정
  var nowPlaying: [JSON] = []
  var topRated: [JSON] = []
  var popular: [JSON] = []
 
}
