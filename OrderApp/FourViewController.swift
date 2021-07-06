//
//  FourViewController.swift
//  OrderApp
//
//  Created by 김수빈 on 2021/07/03.
//

import Foundation
import UIKit

class FourViewController: UIViewController {

    //MARK: - Prperty
    
    @IBOutlet weak var labelList: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var textPhone: UITextField!
    
    
    //MARK: - Lifecycle
    
    // 어디엔가 로드 메모리
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cart = CartSingleton.shared
        var list = ""
        var total = 0
        for (index, menu) in cart.menuArray!.enumerated(){
            list += menu + " / "
            list += String(cart.countArray![index]) + " / "
            list += String(cart.totalPriceArray![index]) + "\n"
            total += cart.totalPriceArray![index]
        }
        labelList.text = list
        labelTotal.text = "총 " + String(total) + "원"
        
    }

    // "뷰가 나타날 것이다."
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG VC4 >> \(#function) ")
    }
    
    // "뷰가 나타났다."
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DEBUG VC4 >> \(#function) ")
    }
    
    // "뷰가 사라질 것이다."
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("DEBUG VC4 >> \(#function) ")
    }
    
    // "뷰가 사라졌다."
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("DEBUG VC4 >> \(#function) ")
    }
    
    //MARK: - Action
    
    
    @IBAction func btnNotSave(_ sender: Any) {
        let alert = UIAlertController(title: "주문 완료", message: "이용해주셔서 감사합니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler : {(alert: UIAlertAction!) in exit(0)} )
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    

    @IBAction func btnSave(_ sender: Any) {
        let alert = UIAlertController(title: "주문 완료", message: textPhone.text! + "님 적립 완료되었습니다. \n이용해주셔서 감사합니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler : {(alert: UIAlertAction!) in exit(0)} )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func turnoff(){
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
}
