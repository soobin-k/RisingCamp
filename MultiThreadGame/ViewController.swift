//
//  ViewController.swift
//  MultiThreadGame
//
//  Created by 김수빈 on 2021/07/12.
//

import UIKit

class ViewController: UIViewController {

    //라면 조리 순서별 이미지
    let ramenImage = [UIImage(named: "ramen1"), UIImage(named: "ramen2"), UIImage(named: "ramen3"), UIImage(named: "ramen4"), UIImage(named: "ramen5"), UIImage(named: "ramen6"), UIImage(named: "ramen7")]
    
    //라면 재료 배열
    let ingredientArray = ["물", "스프", "면", "파", "계란"]
    
    //라면 냄비별 상태
    var ramenState = ["시작", "시작", "시작", "시작"]
    
    //현재 선택된 재료
    var selectedIngredient: String = ""
    
    //라면 냄비 버튼
    @IBOutlet weak var btnRamen1: UIButton!
    @IBOutlet weak var btnRamen2: UIButton!
    @IBOutlet weak var btnRamen3: UIButton!
    @IBOutlet weak var btnRamen4: UIButton!
    
    //라면 재료 버튼
    @IBOutlet weak var btnIngredient1: UIButton!
    @IBOutlet weak var btnIngredient2: UIButton!
    @IBOutlet weak var btnIngredient3: UIButton!
    @IBOutlet weak var btnIngredient4: UIButton!
    @IBOutlet weak var btnIngredient5: UIButton!
    
    @IBOutlet weak var imageCurrentIngredient: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
              //  setupData02()

    }
    
    //화면 가로로 설정
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeLeft
    }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return .landscapeLeft
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
    
    //현재 재료 선택
    @IBAction func btnIngredient1(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient5")
        selectedIngredient = ingredientArray[0]
    }
    
    @IBAction func btnIngredient2(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient1")
        selectedIngredient = ingredientArray[1]
    }
    @IBAction func btnIngredient3(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient3")
        selectedIngredient = ingredientArray[2]
    }
    @IBAction func btnIngredient4(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient2")
        selectedIngredient = ingredientArray[3]
    }
    @IBAction func btnIngredient5(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient4")
        selectedIngredient = ingredientArray[4]
    }
    
    
    //라면 냄비 클릭 쓰레드 생성
    @IBAction func btnRamen1(_ sender: Any) {
        //btnRamen1.setImage(self.ramenImage[0], for: .normal)
        if(selectedIngredient == "물" && ramenState[0] == "시작"){
            ramenState[0] = "물"
            self.btnRamen1.setImage(self.ramenImage[1], for: .normal)
            
            DispatchQueue.global(qos: .userInitiated).async {
                for _ in 0...10 {
                    if(self.selectedIngredient == "스프" && self.ramenState[0] == "물"){
                        self.ramenState[0] = "스프"
                        DispatchQueue.main.sync {
                            self.btnRamen1.setImage(self.ramenImage[2], for: .normal)
                        }
                    }
                    else if(self.selectedIngredient == "면" && self.ramenState[0] == "스프"){
                        self.ramenState[0] = "면"
                        DispatchQueue.main.sync {
                            self.btnRamen1.setImage(self.ramenImage[3], for: .normal)
                        }
                    }
                    else if(self.selectedIngredient == "파" && self.ramenState[0] == "면"){
                        self.ramenState[0] = "파"
                        DispatchQueue.main.sync {
                            self.btnRamen1.setImage(self.ramenImage[4], for: .normal)
                        }
                    }
                    else if(self.selectedIngredient == "계란" && self.ramenState[0] == "파"){
                        self.ramenState[0] = "계란"
                        DispatchQueue.main.sync {
                            self.btnRamen1.setImage(self.ramenImage[5], for: .normal)
                        }
                    }
                    usleep(1000000)
                }
                DispatchQueue.main.sync {
                    self.btnRamen1.setImage(self.ramenImage[6], for: .normal)
                }
            }
        }
    }
    
    
    
    /*
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
    }*/
    

}

