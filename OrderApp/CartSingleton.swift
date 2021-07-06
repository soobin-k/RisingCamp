//
//  CartSingleton.swift
//  OrderApp
//
//  Created by 김수빈 on 2021/07/07.
//

import Foundation
class CartSingleton: NSObject{
    static let shared = CartSingleton()
    var menuArray: [String]? = []
    var countArray: [Int]? = []
    var totalPriceArray: [Int]? = []
    
    private override init(){
        
    }
}
