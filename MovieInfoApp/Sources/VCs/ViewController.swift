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
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var labelProfile: UILabel!
    let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=12d1693e997e213480139d81b182e00d&language=ko-KR&page=1"
    private var lists: [JSON] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getMovieList()
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
                
                //사용자 정보 저장
                let UserVO = UserVO.shared
                self.labelProfile.text = user?.kakaoAccount?.profile?.nickname
                UserVO.userName = (user?.kakaoAccount?.profile?.nickname)!
                
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                    let data = try? Data(contentsOf: url) {
                    self.imageProfile.image = UIImage(data: data)
                    UserVO.userImage = UIImage(data: data)!
                }
            }
        }
        
        // 다음 컨트롤러에 대한 인스턴스 생성
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "TopTabBarViewController") as? TopTabBarViewController else { return }
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
        //vc.modalPresentationStyle = .fullScreen
        // 화면을 전환하다.
        //present(vc, animated: true)
        
        
        
    }
    func getMovieList(){
        AF.request(url).responseJSON { [self] (response) in
            if let value = response.value{ // value가 옵셔널이 아니라면(값이 있다면) 변수를 대입해줘!
                let json = JSON(value)
                self.lists = json["results"].arrayValue //배열 값이다.
                //print(lists)
                let MovieVO = MovieVO.shared
                MovieVO.upComing = lists
                //self.tableView.reloadData()
            }
            
        }
    }
}

