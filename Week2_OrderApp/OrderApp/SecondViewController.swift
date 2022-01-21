//
//  SecondViewController.swift
//  OrderApp
//
//  Created by 김수빈 on 2021/07/07.
//


import Foundation

import UIKit

class SecondViewController: UIViewController {
    
    
    //MARK: - Prperty
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var btnTotal: UIButton!
    
    
    //var resultText: String?
    var resultCart : Int = 3
    var totalPrice = 0
    
    //MARK: - Lifecycle
    func onUserAction(data: String)
    {
        print("Data received: \(data)")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Second DEBUG VC1 >> \(#function) ")
        stackView.subviews.last!.tag = 3000
    }

    // "뷰가 나타날 것이다."
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Second DEBUG VC1 >> \(#function) ")
        let cart = CartSingleton.shared;
        //카트에 상품이 있으면 출력
        totalPrice = 0
        if cart.menuArray?.isEmpty == false{
            for (index, num) in cart.menuArray!.enumerated() {
                addCart(menu: num, count: cart.countArray![index],  total: cart.totalPriceArray![index])
                totalPrice += cart.totalPriceArray![index]
            }
            btnTotal.setTitle("총 " + String(totalPrice) + "원", for: .normal)
        }
            //label1.text = CartSingleton.shared.menuArray?[0]
        
        
    }
    
    // "뷰가 나타났다."
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second DEBUG VC1 >> \(#function) ")
    }
    
    // "뷰가 사라질 것이다."
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second DEBUG VC1 >> \(#function) ")
        let nextEntryIndex = stackView.arrangedSubviews.count - 1
        if nextEntryIndex == 0 {
            print("삭제할 뷰가 없다.")
        }else{
            
            for subview in stackView.subviews as [UIView]
            {
                if (subview.tag != 3000) {
                    subview.isHidden = true
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    // "뷰가 사라졌다."
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Second DEBUG VC1 >> \(#function) ")
        
        
    }
    
    //MARK: - Action
    
    
    
    @IBAction func item1Click(_ sender: Any) {
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc2 = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        
        vc2.resultItem = 0
        vc2.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc2, animated: true)
    }
    
    @IBAction func item2Click(_ sender: Any) {
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc2 = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        
        vc2.resultItem = 1
        vc2.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc2, animated: true)
    }
    
    @IBAction func item3Click(_ sender: Any) {
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc2 = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        
        vc2.resultItem = 2
        vc2.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc2, animated: true)
    }
    
    @IBAction func item4Click(_ sender: Any) {
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc2 = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        
        vc2.resultItem = 3
        vc2.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc2, animated: true)
    }
    
    
    @IBAction func addEntry(_ sender: Any) {
        
    }
    

    func addCart(menu : String?, count : Int?, total : Int?){
        // stack view에 있는 add button을 가져온다.

        guard let addButtonContainerView = stackView.arrangedSubviews.last else {

            fatalError("Expected at least one arranged view in the stack view")
        }
        
        // add button 한 칸 앞 index를 가져 온다

        let nextEntryIndex = stackView.arrangedSubviews.count - 1
        print(nextEntryIndex)

        // scrollview의 스크롤이 이동할 위치계산

        // 현 위치에서 add button의 높이 만큼 이레러

        let offset = CGPoint(x: scrollView.contentOffset.x, y:

scrollView.contentOffset.y + addButtonContainerView.bounds.size.height)

        // stackview를 만들어서 안 보이게 처리

        let newEntryView = createEntryView(menu: menu, count: count, total: total)

        newEntryView.isHidden = true
        
        // 만들어진 stack view를 add button앞에다가 추가

        stackView.insertArrangedSubview(newEntryView, at: nextEntryIndex)

        // 0.25초 동안 추가된 뷰가 보이게 하면서 scrollview의 스크롤 이동
        UIView.animate(withDuration: 0.25) {
            newEntryView.isHidden = false
            self.scrollView.contentOffset = offset

        }
    }
    
    @objc func deleteStackView(sender: UIButton) {

        // 클릭 했을 때 버튼의 슈퍼뷰, 즉 버튼이 속해있는 stack view를 가지고 온다

        guard let entryView = sender.superview else { return }

        // 0.25동안 그 스택뷰를 안 보이게 하고

        // 완료하면 view 계층구조에서 제거한다

        // view 계층구조에서 제거하면 stackviewe에 arragedSubview에서도 자동적으로 제거됨
        let superview = entryView.superview
        let cart = CartSingleton.shared
        //let index = entryView.index(ofAccessibilityElement: stackView as Any)
        var index = -1
        for subview in superview!.subviews{
            if entryView === subview as? UIStackView {
                break
            }
            index += 1
            
        }
        totalPrice -= cart.totalPriceArray![index]
        
        btnTotal.setTitle("총 " + String(totalPrice) + "원", for: .normal)
        cart.countArray?.remove(at: index)
        cart.menuArray?.remove(at: index)
        cart.totalPriceArray?.remove(at: index)
        
        UIView.animate(withDuration: 0.25, animations: {

            entryView.isHidden = true

        }, completion: { _ in

            entryView.removeFromSuperview()

        })
        
        

    }
    
    @objc func modifyStackView(sender: UIButton) {

        // 클릭 했을 때 버튼의 슈퍼뷰, 즉 버튼이 속해있는 stack view를 가지고 온다
        
        guard let entryView = sender.superview else { return }
        let superview = entryView.superview
        //let index = entryView.index(ofAccessibilityElement: stackView as Any)
        var num = -1
        for subview in superview!.subviews{
            if entryView === subview as? UIStackView {
                break
            }
            num += 1
        }
        guard let vc2 = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        
        vc2.num = num
        vc2.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc2, animated: true)
        

    }

    // 수직 스택뷰 안에 들어갈 수평 스택뷰들 만든다.

        private func createEntryView(menu : String?, count : Int?, total : Int?) -> UIView {

            //날짜 DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
            
            // 상품명, 수량, 총 가격

            let date = menu! + " / " + String(count!) + " / " + String(total!)

            // uuid를 가져온다
            let number = NSUUID().uuidString
            
            // 스택뷰를 만들고

            // 각 속성을 아래와 같이 한다.

            // IB에서 하는 것과 같다

            let stack = UIStackView()

            stack.axis = .horizontal

            stack.alignment = .center

            stack.distribution = .fill

            stack.spacing = 8

            // 날짜르 표시해줄 Label를 만든다

            let dateLabel = UILabel()

            dateLabel.text = date

            dateLabel.font = UIFont.preferredFont(forTextStyle: .body)


            // uuid를 만들 Label을 만든다

            let numberLabel = UILabel()

            numberLabel.text = number

            numberLabel.font = UIFont.preferredFont(forTextStyle: .headline)

            

            // 이 label의 horizontal contenthugging을 249, compressionResistance 749로 해서 stackview의 남은 공간을 꽉 채우게 한다.

            dateLabel.setContentHuggingPriority(UILayoutPriority.defaultLow - 1.0, for: .horizontal)

            dateLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh - 1.0, for: .horizontal)

            //수정 버튼
            let modifyButton = UIButton(type: .roundedRect)

            modifyButton.setTitle(" 수정 ", for: .normal)
            modifyButton.setTitleColor(.white, for: .normal)
            modifyButton.backgroundColor = UIColor.green
            modifyButton.borderWidth = 2
            modifyButton.borderColor = UIColor.white
            
            // 삭제버튼이 눌렸다가 떨어질 때 deleteStackView를 호출하게끔 연결한다.

            modifyButton.addTarget(self, action: #selector(modifyStackView(sender:)), for: .touchUpInside)
            

            // 삭제 버튼을 만든다

            let deleteButton = UIButton(type: .roundedRect)

            deleteButton.setTitle(" 삭제 ", for: .normal)
            deleteButton.setTitleColor(.white, for: .normal)
            deleteButton.backgroundColor = UIColor.red
            deleteButton.borderWidth = 2
            deleteButton.borderColor = UIColor.white
            // 삭제버튼이 눌렸다가 떨어질 때 deleteStackView를 호출하게끔 연결한다.

            deleteButton.addTarget(self, action: #selector(deleteStackView(sender:)), for: .touchUpInside)

            

            //stack 뷰에 차례대로 쌓는다.

            stack.addArrangedSubview(dateLabel)

            stack.addArrangedSubview(modifyButton)

            stack.addArrangedSubview(deleteButton)

            

            return stack

        }
    
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func btnBuy(_ sender: Any) {
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc4 = storyboard?.instantiateViewController(withIdentifier: "FourViewController") as? FourViewController else { return }
        vc4.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc4, animated: true)
    }
    
    //MARK: - Helper
    
    
}
