//
//  SplashViewController.swift
//  FoodDevilery1
//
//  Created by Atish Manala on 12/05/25.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0 ){
            self.goToHomeScreen()
        }
    }
    
    func goToHomeScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeViewVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController")as?
            HomeViewController{
            homeViewVC.modalTransitionStyle = .crossDissolve
            
            homeViewVC.modalPresentationStyle = .fullScreen
            self.present(homeViewVC, animated: true , completion: nil)
        }
    }

}
