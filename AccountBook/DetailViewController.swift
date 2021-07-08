//
//  DetailViewController.swift
//  AccountBook
//
//  Created by 김수빈 on 2021/07/07.
//

import Foundation
import UIKit
class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var labelMemo: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labelPrice: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    var selectRow = 0
    var list: AccountBookList?
    var indexOfList = 0
    var isExtended = true
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
        labelMemo.text = list?.memo!
        labelPrice.text = list?.price!
        pickerView.selectRow((list?.type)!, inComponent:0, animated:true)
        if(list?.isExpenditure! == false){
           segmented.selectedSegmentIndex = 1
           isExtended = false
        }
        
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
                isExtended = true
            }
        if (sender as AnyObject).selectedSegmentIndex == 1 {
                isExtended = false
            }
    }
    @IBAction func btnEdit(_ sender: Any) {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: today)
        accountList[indexOfList].date = dateString
        accountList[indexOfList].memo = labelMemo.text
        accountList[indexOfList].price = labelPrice.text
        accountList[indexOfList].type = selectRow
        print(selectRow)
        accountList[indexOfList].image = buyImage[selectRow]
        accountList[indexOfList].isExpenditure = isExtended
        _ = navigationController?.popViewController(animated: true)
    }
    
}
