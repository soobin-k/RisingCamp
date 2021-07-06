//
//  File.swift
//  AccountBook
//
//  Created by 김수빈 on 2021/07/07.
//

import Foundation
import UIKit
class AccountBookList{
    var image : UIImage?
    var type : String?
    var memo : String?
    var price : String?
    var date : String?
    
    init( image : UIImage, type: String, memo: String, price: String, date: String){
        self.image = image
        self.type = type
        self.memo = memo
        self.price = price
        self.date = date
    }
}
