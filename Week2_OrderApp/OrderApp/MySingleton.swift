//
//  MySingleton.swift
//  OrderApp
//
//  Created by 김수빈 on 2021/07/07.
//

import Foundation
import UIKit

class MySingleton: NSObject{
    static let shared = MySingleton()
    var imageArray: [UIImage] = []
    var nameArray: [String] = []
    var priceArray: [Int] = []
    var contextArray: [String] = []
    
    private override init(){
        self.imageArray = [#imageLiteral(resourceName: "item2"),#imageLiteral(resourceName: "item4"),#imageLiteral(resourceName: "item1"),#imageLiteral(resourceName: "item3")]
        self.nameArray = ["불고기버거", "프렌치프라이", "콜라", "아이스크림"]
        self.priceArray = [7200, 2100, 1000, 500]
        self.contextArray = ["볼륨 가득한 패티와 불고기 소스가 잘 조화된 영양만점의 햄버거", "세계 최고의 감자만 엄선해서 버거킹만의 비법으로 바삭하게", "톡 쏘는 상쾌함, 언제 어디서나 통하는 음료의 세계 공통어, 코카콜라", "천연 바닐라 빈과 건강한 퓨어 발효 버터로 풍미를 높인 콘 아이스크림"]
    }
}
