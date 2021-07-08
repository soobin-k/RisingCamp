//
//  AccountBookList.swift
//  AccountBook
//
//  Created by 김수빈 on 2021/07/08.
//

import Foundation
import UIKit
class AccountBookList {
  var storage: [AccountBook]
  init() {
   self.storage = [AccountBook]()
  }
    public var count: Int{
   return storage.count
  }
  public func addNew(image : UIImage, type: Int, memo: String, price: String, date: String, isExpenditure: Bool) {
    self.storage.append(AccountBook(image: image, type: type, memo: memo, price: price, date: date, isExpenditure: isExpenditure))
  }
  public func delete(indexRow : Int) {
        self.storage.remove(at: indexRow)
  }
  public func itemAt(index: Int) -> AccountBook {
    return storage[index]
  }
    public func edit(image : UIImage, type: Int, memo: String, price: String, date: String, isExpenditure: Bool, index: Int){
        storage[index].image = image
        storage[index].type = type
        storage[index].memo = memo
        storage[index].price = price
        storage[index].date = date
        storage[index].isExpenditure = isExpenditure
    }
}
