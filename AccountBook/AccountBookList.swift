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
    var type : Int?
    var memo : String?
    var price : String?
    var date : String?
    var isExpenditure : Bool?
    
    init( image : UIImage, type: Int, memo: String, price: String, date: String, isExpenditure: Bool){
        self.image = image
        self.type = type
        self.memo = memo
        self.price = price
        self.date = date
        self.isExpenditure = isExpenditure
    }
}
