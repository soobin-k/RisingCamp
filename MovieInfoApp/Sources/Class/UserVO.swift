//
//  UserVO.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/21.
//

import Foundation
import UIKit

class UserVO : NSObject {
    static let shared = UserVO()
    var userImage: UIImage = #imageLiteral(resourceName: "Play")
    var userName: String = ""
}
