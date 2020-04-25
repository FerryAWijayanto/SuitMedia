//
//  EventVC.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    let homeView = HomeView()
    
    override func loadView() {
        view = homeView
        homeView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
    }
}

extension HomeVC: HomeViewDelegate {
    func presentToEvent() {
        print("event")
        let eventVC = EventVC()
        navigationController?.pushViewController(eventVC, animated: true)
        eventVC.delegate = self
    }
    
    func presentToGuest() {
        print("guest")
        let guestVC = GuestViewController()
        navigationController?.pushViewController(guestVC, animated: true)
    }
}

extension HomeVC: EventVCDelegate {
    func getNameEvent(name: String) {
        homeView.nameLbl.text = name
    }
    
    
}
