//
//  EventTableViewController.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

protocol EventVCDelegate {
    func getNameEvent(name: String)
}

class EventVC: UIViewController {
    
    let backBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "ic_back_white").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return btn
    }()
    
    let eventLbl = UILabel(headerText: "Events", color: .white, fontSize: 20)
    let searchBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "ic_search_white").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let mapBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "ic_map_view").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(handleToMap), for: .touchUpInside)
        return btn
    }()
    
    let containerNav = UIView(color: #colorLiteral(red: 0.9058823529, green: 0.4705882353, blue: 0.1764705882, alpha: 1), cornerRadius: 0)
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let dataSource = EventDataSource()
    let store = EventStore()
    
    var delegate: EventVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigation()
        configureTableView()
        fetchEvent()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func fetchEvent() {
        store.fetch { (items) in
            self.dataSource.eventItems = items
        }
    }
    
    @objc private func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleToMap() {
        let mapVC = MapViewController()
        present(mapVC, animated: true, completion: nil)
    }
    
    private func configureNavigation() {
        view.addSubview(containerNav)
        containerNav.translatesAutoresizingMaskIntoConstraints = false
        
        [backBtn, eventLbl, searchBtn, mapBtn].forEach({ v in
            v.translatesAutoresizingMaskIntoConstraints = false
            containerNav.addSubview(v)
        })
        
        eventLbl.textAlignment = .left
        
        NSLayoutConstraint.activate([
            containerNav.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerNav.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerNav.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerNav.heightAnchor.constraint(equalToConstant: 58),
            
            backBtn.centerYAnchor.constraint(equalTo: containerNav.centerYAnchor),
            backBtn.leadingAnchor.constraint(equalTo: containerNav.leadingAnchor, constant: 8),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            
            eventLbl.centerYAnchor.constraint(equalTo: containerNav.centerYAnchor),
            eventLbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 8),
            eventLbl.trailingAnchor.constraint(equalTo: searchBtn.leadingAnchor, constant: 8),
            
            searchBtn.centerYAnchor.constraint(equalTo: containerNav.centerYAnchor),
            searchBtn.trailingAnchor.constraint(equalTo: mapBtn.leadingAnchor, constant: -8),
            searchBtn.widthAnchor.constraint(equalToConstant: 30),
            searchBtn.heightAnchor.constraint(equalToConstant: 30),
            
            mapBtn.centerYAnchor.constraint(equalTo: containerNav.centerYAnchor),
            mapBtn.trailingAnchor.constraint(equalTo: containerNav.trailingAnchor, constant: -8),
            mapBtn.widthAnchor.constraint(equalToConstant: 30),
            mapBtn.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.cellID)
        tableView.rowHeight = 150
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerNav.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension EventVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! EventCell
        
        guard let name = cell.eventNameLbl.text else { return }
        
        delegate?.getNameEvent(name: name)
        
        navigationController?.popViewController(animated: true)
    }
}
