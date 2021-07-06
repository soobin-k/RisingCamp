//
//  ThirdViewController.swift
//  OrderApp
//
//  Created by 김수빈 on 2021/07/07.
//
import Foundation

import UIKit

class ThirdViewController: UIViewController {

    //MARK: - Prperty
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelContext: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var resultItem : Int = -1
    var num : Int = -1
    var retry : Bool = false
    let mySingleton = MySingleton.shared
    let cartSingleton = CartSingleton.shared
    //let nameArray = MySingleton.shared.nameArray
    //let priceArray = MySingleton.shared.priceArray
    
    //var SecondViewController : SecondViewController?
    
    //var menuArray = CartSingleton.shared.menuArray
    //var countArray = CartSingleton.shared.countArray
    //var totalPriceArray = CartSingleton.shared.totalPriceArray
    
    //MARK: - Lifecycle
    
    // 어디엔가 로드 메모리
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
    }

    // "뷰가 나타날 것이다."
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Third DEBUG VC1 >> \(#function) ")
        if(resultItem != -1){
            labelName.text = mySingleton.nameArray[resultItem]
            labelPrice.text = String(mySingleton.priceArray[resultItem])
            labelContext.text = mySingleton.contextArray[resultItem]
            imageLogo.image = mySingleton.imageArray[resultItem]
        }else{
            retry = true
            labelName.text = cartSingleton.menuArray?[num]
            
            //labelCount.text = cartSingleton.countArray?[num]
            let itemIndex = mySingleton.nameArray.firstIndex(of: labelName.text!)
            labelPrice.text = String(mySingleton.priceArray[itemIndex!])
            labelContext.text = mySingleton.contextArray[itemIndex!]
            imageLogo.image = mySingleton.imageArray[itemIndex!]
            let number = cartSingleton.countArray?[num]
            labelCount.text = "수량 : " + String(number!)
        }
    }
    
    // "뷰가 나타났다."
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Third DEBUG VC1 >> \(#function) ")
    }
    
    // "뷰가 사라질 것이다."
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Third DEBUG VC1 >> \(#function) ")
    }
    
    // "뷰가 사라졌다."
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Third DEBUG VC1 >> \(#function) ")
    }
    
    //MARK: - Action
    
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func btnAddcart(_ sender: Any) {
        
        let cart = CartSingleton.shared
        let number = labelCount.text!.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        let number2 = labelPrice.text!.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        if(retry == false){
            cart.menuArray?.append(labelName.text!)
            
            cart.countArray?.append(Int(number)!);
            cart.totalPriceArray?.append(Int(number2)! * Int(number)!)
            print(cart.countArray?[0] as Any)
            print(cart.totalPriceArray?[0] as Any)
            dismiss(animated: true)
        }else{
            cart.countArray?[num] = Int(number)!
            cart.totalPriceArray?[num] = Int(number2)! * Int(number)!
            dismiss(animated: true)
        }
    }
    @IBAction func btnStepper(_ sender: UIStepper) {
        labelCount.text = "수량 : " + Int(sender.value).description
    }
    
}

