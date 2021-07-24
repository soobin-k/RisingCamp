//
//  BookVO.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/24.
//

import Foundation
import UIKit

//예매 내역
class BookVO :NSObject{
  static let shared = BookVO()
  var movieTitle: [String] = []// 영화 제목
  var movieDate: [String] = []

}
