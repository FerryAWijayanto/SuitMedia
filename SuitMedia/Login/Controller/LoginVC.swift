//
//  LoginVC.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let loginView = LoginView()
    let store = LoginStore()
    
    override func loadView() {
        view = loginView
        loginView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
    }
}

extension LoginVC: LoginViewDelegate {
    func presentToNext(name: String) {
        let eventVC = HomeVC()
        eventVC.homeView.nameLbl.text = name
        navigationController?.pushViewController(eventVC, animated: true)
    }
    
    func presentToCheck(palindrome: String) {
        store.isPalindrome(word: palindrome, success: {
            Alert.presentAlert(at: self, with: "isPalindrome", message: "true")
        }) {
            Alert.presentAlert(at: self, with: "notPalindrome", message: "false")
        }
    }
}

