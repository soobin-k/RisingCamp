//
//  ViewController.swift
//  MovieInfoApp
//
//  Created by 김수빈 on 2021/07/19.
//
import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var labelProfile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnLogin(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                    
                    // 어세스토큰
                    //let accessToken = oauthToken?.accessToken
                    
                    //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                    self.setUserInfo()
                }
            }
    }
    
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                self.labelProfile.text = user?.kakaoAccount?.profile?.nickname
                
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                    let data = try? Data(contentsOf: url) {
                    self.imageProfile.image = UIImage(data: data)
                }
            }
        }
        
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
    
        vc.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        present(vc, animated: true)
        
        
        
    }
    
}

