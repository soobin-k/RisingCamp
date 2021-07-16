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
    var timer2:Timer = Timer()
    var timer3:Timer = Timer()
    var timer4:Timer = Timer()
    var count:[Int] = [0,0,0,0]
    var timerCounting:[Bool] = [false,false,false,false]
    
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
    
    @IBOutlet weak var imageHeart1: UIImageView!
    @IBOutlet weak var imageHeart2: UIImageView!
    @IBOutlet weak var imageHeart3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        /*
        progressView.setProgress(1.0, animated: true)
        ramenState = ["시작", "시작", "시작", "시작"]
        timerCounting = [false,false,false,false]
        labelScore.text = String(score)*/
        mainLoop()
    }
    override func viewDidDisappear(_ animated: Bool) {
        //++현재 상태 초기화
        mainCount = 0
        score = 0
        heartLimit = 3
        count = [0,0,0,0]
        selectedIngredient = ""
        progressView.setProgress(1.0, animated: true)
        ramenState = ["시작", "시작", "시작", "시작"]
        
        labelScore.text = String(score)
        if(timerCounting[0]){
            timer.invalidate()
        }
        if(timerCounting[1]){
            timer2.invalidate()
        }
        if(timerCounting[2]){
            timer3.invalidate()
        }
        if(timerCounting[3]){
            timer4.invalidate()
        }
        if(mainTimerCounting){
            mainTimer.invalidate()
        }
        mainTimerCounting = false
        timerCounting = [false,false,false,false]
        imageHeart3.image = UIImage(named: "ramen1")
        imageHeart2.image = UIImage(named: "ramen1")
        imageHeart1.image = UIImage(named: "ramen1")
        btnRamen1.setImage(UIImage(named: "ramen1"), for: .normal)
        btnRamen2.setImage(UIImage(named: "ramen1"), for: .normal)
        btnRamen3.setImage(UIImage(named: "ramen1"), for: .normal)
        btnRamen4.setImage(UIImage(named: "ramen1"), for: .normal)
        imageCurrentIngredient.image = nil
        imageResult.image = nil

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
                print("⏳ 남은 게임 시간 : " + String(60-mainCount) + "초")
                progressView.setProgress(progressView.progress - 0.0167, animated: true)
            }
            else{
                mainTimer.invalidate()
                mainTimerCounting = false
                print("😇 게임 종료")
                // 다음 컨트롤러에 대한 인스턴스 생성
                guard let vc = storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as? GameOverViewController else { return }
                vc.score = score
                vc.modalPresentationStyle = .fullScreen
                // 화면을 전환하다.
                present(vc, animated: true)
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
    
    func minusHeart(num : Int) -> Void {
        if(num == 2){
            imageHeart3.image = nil
        }else if(num == 1){
            imageHeart2.image = nil
        }else if(num == 0){
            imageHeart1.image = nil
        }else{
            mainTimer.invalidate()
            mainTimerCounting = false
            print("😇 게임 종료")
            // 다음 컨트롤러에 대한 인스턴스 생성
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as? GameOverViewController else { return }
            vc.score = score
            vc.modalPresentationStyle = .fullScreen
            // 화면을 전환하다.
            present(vc, animated: true)
        }
    }
    
    // 라면 냄비 카운터1
    @objc func timerCounter() -> Void
    {
        count[0] = count[0] + 1
        
        if(count[0]<=10){
            print("🍜 ramen1 : " + String(count[0]) + "초")
        }
        else{
            self.ramenState[0] = "끝"
            timer.invalidate()
            timerCounting[0] = false
            print("⏰ 타이머 종료")
            count[0] = 0
            DispatchQueue.main.sync {
                self.btnRamen1.setImage(self.ramenImage[6], for: .normal)
            }
        }
    }
        
        
    //라면 냄비 클릭 쓰레드 생성
    @IBAction func btnRamen1(_ sender: Any) {
        //btnRamen1.setImage(self.ramenImage[0], for: .normal)
        if(!timerCounting[0]){
            if(selectedIngredient == "물" && ramenState[0] == "시작"){
                ramenState[0] = "물"
                self.btnRamen1.setImage(self.ramenImage[1], for: .normal)
                DispatchQueue.global(qos: .userInitiated).async { [self] in
                    timerCounting[0] = true
                    let runLoop = RunLoop.current
                    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
                    
                    while timerCounting[0]{
                        runLoop.run(until: Date().addingTimeInterval(0.1))
                    }
                }
            }
            else if(ramenState[0] == "끝"){
                self.btnRamen1.setImage(self.ramenImage[0], for: .normal)
                heartLimit -= 1
                minusHeart(num: heartLimit)
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
                timerCounting[0] = false
                print("⏰ 타이머 종료")
                count[0] = 0
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

    // 라면 냄비 카운터2
    @objc func timerCounter2() -> Void
    {
        count[1] = count[1] + 1
        
        if(count[1]<=10){
            print("🍜 ramen2 : " + String(count[1]) + "초")
        }
        else{
            self.ramenState[1] = "끝"
            timer2.invalidate()
            timerCounting[1] = false
            print("⏰ 타이머2 종료")
            count[1] = 0
            DispatchQueue.main.sync {
                self.btnRamen2.setImage(self.ramenImage[6], for: .normal)
            }
        }
    }
    @IBAction func btnRamen2(_ sender: Any) {
        if(!timerCounting[1]){
            if(selectedIngredient == "물" && ramenState[1] == "시작"){
                ramenState[1] = "물"
                self.btnRamen2.setImage(self.ramenImage[1], for: .normal)
                DispatchQueue.global(qos: .userInitiated).async { [self] in
                    timerCounting[1] = true
                    let runLoop = RunLoop.current
                    timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter2), userInfo: nil, repeats: true)
                    
                    while timerCounting[1]{
                        runLoop.run(until: Date().addingTimeInterval(0.1))
                    }
                 
                }
            }
            else if(ramenState[1] == "끝"){
                self.btnRamen2.setImage(self.ramenImage[0], for: .normal)
                heartLimit -= 1
                minusHeart(num: heartLimit)
                print("💔 목숨 개수 : " + String(heartLimit))
                self.imageResult.image = #imageLiteral(resourceName: "ramen7")
                self.ramenState[1] = "시작"
            }
        }else{
            if(self.selectedIngredient == "스프" && self.ramenState[1] == "물"){
                self.ramenState[1] = "스프"
                
                    self.btnRamen2.setImage(self.ramenImage[2], for: .normal)
                
            }
            else if(self.selectedIngredient == "면" && self.ramenState[1] == "스프"){
                self.ramenState[1] = "면"
                
                    self.btnRamen2.setImage(self.ramenImage[3], for: .normal)
                
            }
            else if(self.selectedIngredient == "파" && self.ramenState[1] == "면"){
                self.ramenState[1] = "파"
               
                    self.btnRamen2.setImage(self.ramenImage[4], for: .normal)
                
            }
            else if(self.selectedIngredient == "계란" && self.ramenState[1] == "파"){
                self.ramenState[1] = "계란"
                
                    self.btnRamen2.setImage(self.ramenImage[5], for: .normal)
                
            }
            else if(self.ramenState[1] == "계란"){
                timer2.invalidate()
                timerCounting[1] = false
                print("⏰ 타이머 종료")
                count[1] = 0
                self.btnRamen2.setImage(self.ramenImage[0], for: .normal)
                self.imageResult.image = #imageLiteral(resourceName: "ramen6")
                self.ramenState[1] = "시작"
                print("💸 1000원 획득")
                score += 1000
                labelScore.text = String(score)
            }
            else{
                print(ramenState[1])
                self.showToast(message: "조리 순서가 틀렸습니다.")
            }
        }
    }

    // 라면 냄비 카운터3
        @objc func timerCounter3() -> Void
        {
            count[2] = count[2] + 1
            
            if(count[2]<=10){
                print("🍜 ramen3 : " + String(count[2]) + "초")
            }
            else{
                self.ramenState[2] = "끝"
                timer3.invalidate()
                timerCounting[2] = false
                print("⏰ 타이머 종료")
                count[2] = 0
                DispatchQueue.main.sync {
                    self.btnRamen3.setImage(self.ramenImage[6], for: .normal)
                }
            }
        }
    
        @IBAction func btnRamen3(_ sender: Any) {
            if(!timerCounting[2]){
                if(selectedIngredient == "물" && ramenState[2] == "시작"){
                    ramenState[2] = "물"
                    self.btnRamen3.setImage(self.ramenImage[1], for: .normal)
                    DispatchQueue.global(qos: .userInitiated).async { [self] in
                        timerCounting[2] = true
                        let runLoop = RunLoop.current
                        timer3 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter3), userInfo: nil, repeats: true)
                        
                        while timerCounting[2]{
                            runLoop.run(until: Date().addingTimeInterval(0.1))
                        }
                    }
                }
                else if(ramenState[2] == "끝"){
                    self.btnRamen3.setImage(self.ramenImage[0], for: .normal)
                    heartLimit -= 1
                    minusHeart(num: heartLimit)
                    print("💔 목숨 개수 : " + String(heartLimit))
                    self.imageResult.image = #imageLiteral(resourceName: "ramen7")
                    self.ramenState[2] = "시작"
                }
            }else{
                if(self.selectedIngredient == "스프" && self.ramenState[2] == "물"){
                    self.ramenState[2] = "스프"
                    
                        self.btnRamen3.setImage(self.ramenImage[2], for: .normal)
                    
                }
                else if(self.selectedIngredient == "면" && self.ramenState[2] == "스프"){
                    self.ramenState[2] = "면"
                    
                        self.btnRamen3.setImage(self.ramenImage[3], for: .normal)
                    
                }
                else if(self.selectedIngredient == "파" && self.ramenState[2] == "면"){
                    self.ramenState[2] = "파"
                   
                        self.btnRamen3.setImage(self.ramenImage[4], for: .normal)
                    
                }
                else if(self.selectedIngredient == "계란" && self.ramenState[2] == "파"){
                    self.ramenState[2] = "계란"
                    
                        self.btnRamen3.setImage(self.ramenImage[5], for: .normal)
                    
                }
                else if(self.ramenState[2] == "계란"){
                    timer3.invalidate()
                    timerCounting[2] = false
                    print("⏰ 타이머3 종료")
                    count[2] = 0
                    self.btnRamen3.setImage(self.ramenImage[0], for: .normal)
                    self.imageResult.image = #imageLiteral(resourceName: "ramen6")
                    self.ramenState[2] = "시작"
                    print("💸 1000원 획득")
                    score += 1000
                    labelScore.text = String(score)
                }
                else{
                    self.showToast(message: "조리 순서가 틀렸습니다.")
                }
            }
        }
    
    // 라면 냄비 카운터4
        @objc func timerCounter4() -> Void
        {
            count[3] = count[3] + 1
            
            if(count[3]<=10){
                print("🍜 ramen4 : " + String(count[3]) + "초")
            }
            else{
                self.ramenState[3] = "끝"
                timer4.invalidate()
                timerCounting[3] = false
                print("⏰ 타이머 종료4")
                count[3] = 0
                DispatchQueue.main.sync {
                    self.btnRamen4.setImage(self.ramenImage[6], for: .normal)
                }
            }
        }
        @IBAction func btnRamen4(_ sender: Any) {
            if(!timerCounting[3]){
                if(selectedIngredient == "물" && ramenState[3] == "시작"){
                    ramenState[3] = "물"
                    self.btnRamen4.setImage(self.ramenImage[1], for: .normal)
                    DispatchQueue.global(qos: .userInitiated).async { [self] in
                        timerCounting[3] = true
                        let runLoop = RunLoop.current
                        timer4 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter4), userInfo: nil, repeats: true)
                        
                        while timerCounting[3]{
                            runLoop.run(until: Date().addingTimeInterval(0.1))
                        }
                    }
                }
                else if(ramenState[3] == "끝"){
                    self.btnRamen4.setImage(self.ramenImage[0], for: .normal)
                    heartLimit -= 1
                    minusHeart(num: heartLimit)
                    print("💔 목숨 개수 : " + String(heartLimit))
                    self.imageResult.image = #imageLiteral(resourceName: "ramen7")
                    self.ramenState[3] = "시작"
                }
            }else{
                if(self.selectedIngredient == "스프" && self.ramenState[3] == "물"){
                    self.ramenState[3] = "스프"
                    
                        self.btnRamen4.setImage(self.ramenImage[2], for: .normal)
                    
                }
                else if(self.selectedIngredient == "면" && self.ramenState[3] == "스프"){
                    self.ramenState[3] = "면"
                    
                        self.btnRamen4.setImage(self.ramenImage[3], for: .normal)
                    
                }
                else if(self.selectedIngredient == "파" && self.ramenState[3] == "면"){
                    self.ramenState[3] = "파"
                   
                        self.btnRamen4.setImage(self.ramenImage[4], for: .normal)
                    
                }
                else if(self.selectedIngredient == "계란" && self.ramenState[3] == "파"){
                    self.ramenState[3] = "계란"
                    
                        self.btnRamen4.setImage(self.ramenImage[5], for: .normal)
                    
                }
                else if(self.ramenState[3] == "계란"){
                    timer4.invalidate()
                    timerCounting[3] = false
                    print("⏰ 타이머 종료")
                    count[3] = 0
                    self.btnRamen4.setImage(self.ramenImage[0], for: .normal)
                    self.imageResult.image = #imageLiteral(resourceName: "ramen6")
                    self.ramenState[3] = "시작"
                    print("💸 1000원 획득")
                    score += 1000
                    labelScore.text = String(score)
                }
                else{
                    self.showToast(message: "조리 순서가 틀렸습니다.")
                }
            }
        }
    
}

