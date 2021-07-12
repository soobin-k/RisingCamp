//
//  ViewController.swift
//  MultiThreadGame
//
//  Created by 김수빈 on 2021/07/12.
//

import UIKit

class ViewController: UIViewController {

    var myMoney: Int = 100
    let ramenImage = [UIImage(named: "ramen1"), UIImage(named: "ramen2"), UIImage(named: "ramen3"), UIImage(named: "ramen4"), UIImage(named: "ramen5"), UIImage(named: "ramen6")]
    
    @IBOutlet weak var btnRamen1: UIButton!
    @IBOutlet weak var btnRamen2: UIButton!
    @IBOutlet weak var btnRamen3: UIButton!
    @IBOutlet weak var btnRamen4: UIButton!
    
    @IBOutlet weak var btnIngredient1: UIButton!
    @IBOutlet weak var btnIngredient2: UIButton!
    @IBOutlet weak var btnIngredient3: UIButton!
    @IBOutlet weak var btnIngredient4: UIButton!
    @IBOutlet weak var btnIngredient5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        setupData01()
                setupData02()
        //        setupData03()
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return .landscapeLeft
    }
    

    /// 1. 데이터가 순서대로 나타나는 경우
    private func setupData01() {
        // 0 -> 100 으로 오름차순으로 숫자를 print 한다.
        ascendingNumber()
        
        // 100 -> 0 으로 내림차순으로 숫자를 print 한다.
        descendingNumber()
    }
    
    /// 2. 데이터가 섞여서 나타나는 경우
    private func setupData02() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            //self.ascendingNumber()
            for _ in 0...100 {
                DispatchQueue.main.sync {
                    self.btnRamen1.setImage(self.ramenImage.randomElement()!!, for: .normal)
                }
                usleep(100000)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            //self.descendingNumber()
            for _ in 0...100 {
                DispatchQueue.main.sync {
                    self.btnRamen2.setImage(self.ramenImage.randomElement()!!, for: .normal)
                }
                usleep(100000)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            //self.descendingNumber()
            for _ in 0...100 {
                DispatchQueue.main.sync {
                    self.btnRamen3.setImage(self.ramenImage.randomElement()!!, for: .normal)
                }
                usleep(100000)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            //self.descendingNumber()
            for _ in 0...100 {
                DispatchQueue.main.sync {
                    self.btnRamen4.setImage(self.ramenImage.randomElement()!!, for: .normal)
                }
                usleep(100000)
            }
        }
    }
    
    /// 3. 공유자원의 문제
    private func setupData03() {
        
        // 첫 번째 출금 : 맥북비용
        DispatchQueue.global(qos: .userInteractive).async {
            var currentMoney = self.myMoney
            currentMoney -= 98
            usleep(100000)
            self.myMoney = currentMoney
        }
        
        // 두 번째 출금 : 대중교통비용
        DispatchQueue.global(qos: .userInteractive).async {
            var currentMoney = self.myMoney
            currentMoney -= 7
            self.myMoney = currentMoney
        }
        
        // 최소 필요한 스시의 개수는 2 개
        
        print("DEBUG>> 현재 잔액 : \(self.myMoney) ")
        if self.myMoney < 0 {
            print("DEBUG>> ❗️ 통장 잔액이 부족합니다. ")
            
        } else {
            print("DEBUG>> 🦞 랍스터 먹을 돈이 있습니다. ")
        }
    }

    
    private func ascendingNumber() {
        for i in 0...100 {
            
            print("🍺  ",i)
            usleep(100000)
        }
    }
    
    private func descendingNumber() {
        for i in (0...100).reversed() {
            print("🍗  ",i)
            usleep(100000)
        }
    }
    

}

