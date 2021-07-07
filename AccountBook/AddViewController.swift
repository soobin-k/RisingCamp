//
//  AddViewController.swift
//  AccountBook
//
//  Created by 김수빈 on 2021/07/07.
//
import UIKit
import Foundation
class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var labelPrice: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labelMemo: UITextField!
  
    let buyType = ["쇼핑","음식","교통","오락","생활","투자", "여행"]
    var selectRow = 0
    // 몇 개씩 보여줄 것인가
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 총 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return buyType.count
    }
    // 뭘 보여줄거냐
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return buyType[row]
    }
    // 선택한 Array의 row값을 가져오기 위해서 초기값인 selectRow에 해당 row를 가져옴
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectRow = row
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: today)
        accountList.append(AccountBookList(image: #imageLiteral(resourceName: "chart"),  type: buyType[selectRow] , memo: labelMemo.text!, price: labelPrice.text!+"원", date: dateString))
        _ = navigationController?.popViewController(animated: true)
    }
    
}
