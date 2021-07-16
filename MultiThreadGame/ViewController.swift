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
    let ingredientArray = ["시작", "물", "스프", "면", "파", "계란", "끝"]
    
    //라면 냄비별 상태
    var ramenState = ["시작", "시작", "시작", "시작"]
    
    //현재 선택된 재료
    var selectedIngredient: String = ""
    
    //생명
    var heartLimit = 3
    
    //타이머, 초, 실행 여부
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    var mainTimer:Timer = Timer()
    var mainCount:Int = 0
    var mainTimerCounting:Bool = false
    
    //현재 스코어
    var score = 0
    
    //프로그래스 뷰
    @IBOutlet weak var progressView: UIProgressView!
    
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
    
    //현재 재료 이미지
    @IBOutlet weak var imageCurrentIngredient: UIImageView!
    
    //결과 이미지
    @IBOutlet weak var imageResult: UIImageView!
    
    @IBOutlet weak var labelScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        mainLoop()
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
    
    //현재 재료 선택
    @IBAction func btnIngredient1(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient5")
        selectedIngredient = ingredientArray[1]
    }
    
    @IBAction func btnIngredient2(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient1")
        selectedIngredient = ingredientArray[2]
    }
    @IBAction func btnIngredient3(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient3")
        selectedIngredient = ingredientArray[3]
    }
    @IBAction func btnIngredient4(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient2")
        selectedIngredient = ingredientArray[4]
    }
    @IBAction func btnIngredient5(_ sender: Any) {
        imageCurrentIngredient.image = #imageLiteral(resourceName: "ingredient4")
        selectedIngredient = ingredientArray[5]
    }
    
    //메인 타이머 카운터
    @objc func mainTimerCounter() -> Void
        {
            mainCount = mainCount + 1
            
            if(mainCount<=60){
                print("⏳ 남은 게임 시간 : " + String(mainCount) + "초")
                progressView.setProgress(progressView.progress - 0.0167, animated: true)
            }
            else{
                mainTimer.invalidate()
                mainTimerCounting = false
                print("😇 게임 종료")
            }
    }
    
    //메인 루프
    func mainLoop(){
        mainTimerCounting = true
        let runLoop = RunLoop.current
        mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mainTimerCounter), userInfo: nil, repeats: true)
        
        while mainTimerCounting{
            runLoop.run(until: Date().addingTimeInterval(0.1))
        }
    }
    
    // 라면 냄비 카운터
    @objc func timerCounter() -> Void
    {
        count = count + 1
        
        if(count<=10){
            print("🍜 ramen1 : " + String(count) + "초")
        }
        else{
            self.ramenState[0] = "끝"
            DispatchQueue.main.sync {
                self.btnRamen1.setImage(self.ramenImage[6], for: .normal)
            }
            timer.invalidate()
            timerCounting = false
            print("⏰ 타이머 종료")
            count = 0
        }
    }
        
        
    //라면 냄비 클릭 쓰레드 생성
    @IBAction func btnRamen1(_ sender: Any) {
        //btnRamen1.setImage(self.ramenImage[0], for: .normal)
        if(!timerCounting){
            if(selectedIngredient == "물" && ramenState[0] == "시작"){
                ramenState[0] = "물"
                self.btnRamen1.setImage(self.ramenImage[1], for: .normal)
                DispatchQueue.global(qos: .userInitiated).async { [self] in
                    timerCounting = true
                    let runLoop = RunLoop.current
                    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
                    
                    while timerCounting{
                        runLoop.run(until: Date().addingTimeInterval(0.1))
                    }
                }
            }
            else if(ramenState[0] == "끝"){
                self.btnRamen1.setImage(self.ramenImage[0], for: .normal)
                heartLimit -= 1
                print("💔 목숨 개수 : " + String(heartLimit))
                self.imageResult.image = #imageLiteral(resourceName: "ramen7")
                self.ramenState[0] = "시작"
            }
        }else{
            if(self.selectedIngredient == "스프" && self.ramenState[0] == "물"){
                self.ramenState[0] = "스프"
                
                    self.btnRamen1.setImage(self.ramenImage[2], for: .normal)
                
            }
            else if(self.selectedIngredient == "면" && self.ramenState[0] == "스프"){
                self.ramenState[0] = "면"
                
                    self.btnRamen1.setImage(self.ramenImage[3], for: .normal)
                
            }
            else if(self.selectedIngredient == "파" && self.ramenState[0] == "면"){
                self.ramenState[0] = "파"
               
                    self.btnRamen1.setImage(self.ramenImage[4], for: .normal)
                
            }
            else if(self.selectedIngredient == "계란" && self.ramenState[0] == "파"){
                self.ramenState[0] = "계란"
                
                    self.btnRamen1.setImage(self.ramenImage[5], for: .normal)
                
            }
            else if(self.ramenState[0] == "계란"){
                timer.invalidate()
                timerCounting = false
                print("⏰ 타이머 종료")
                count = 0
                self.btnRamen1.setImage(self.ramenImage[0], for: .normal)
                self.imageResult.image = #imageLiteral(resourceName: "ramen6")
                self.ramenState[0] = "시작"
                print("💸 1000원 획득")
                score += 1000
                labelScore.text = String(score)
            }
            else{
                self.showToast(message: "조리 순서가 틀렸습니다.")
            }
        }
    }
    
    //토스트 메시지
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview()})
        
    }

   
    /*
    else{
        let alert = UIAlertController(title: "경고", message: "조리 순서가 맞지 않습니다.", preferredStyle: UIAlertController.Style.alert)
        let okay = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(okay)
        self.present(alert, animated: false)
    }*/
    
}

