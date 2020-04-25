//
//  GuestViewController.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

class GuestViewController: UIViewController {
    
    let backBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "ic_back_white").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return btn
    }()
    
    let guestLbl = UILabel(headerText: "Guests", color: .white, fontSize: 20)
    
    let containerNav = UIView(color: #colorLiteral(red: 0.9058823529, green: 0.4705882353, blue: 0.1764705882, alpha: 1), cornerRadius: 0)
    
    var collectionView: UICollectionView!
    let refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresh
    }()
    
    let store = GuestStore()
    let dataSource = GuestDataSource()
    let spinner = UIActivityIndicatorView(style: .large)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(spinner)
        spinner.hidesWhenStopped = true
        spinner.center = view.center
        spinner.startAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureNavigation()
        setupCollectionView()
        fetchGuests()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func fetchGuests() {
        store.fetchGuest(parameter: nil) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let guests):
                self.dataSource.items = guests
                
            case .failure(let error):
                print(error)
                self.dataSource.items.removeAll()
                Alert.presentAlert(at: self, with: "Error", message: error.rawValue, completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.collectionView.reloadSections(IndexSet(integer: 0))
            }
        }
    }
    
    @objc private func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleRefresh() {
        fetchGuests()
        refreshControl.endRefreshing()
    }
    
    private func configureNavigation() {
        view.addSubview(containerNav)
        containerNav.translatesAutoresizingMaskIntoConstraints = false
        
        [backBtn, guestLbl].forEach({ v in
            v.translatesAutoresizingMaskIntoConstraints = false
            containerNav.addSubview(v)
        })
        
        guestLbl.textAlignment = .left
        
        NSLayoutConstraint.activate([
            containerNav.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerNav.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerNav.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerNav.heightAnchor.constraint(equalToConstant: 58),
            
            backBtn.centerYAnchor.constraint(equalTo: containerNav.centerYAnchor),
            backBtn.leadingAnchor.constraint(equalTo: containerNav.leadingAnchor, constant: 8),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            
            guestLbl.centerYAnchor.constraint(equalTo: containerNav.centerYAnchor),
            guestLbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 8),
            guestLbl.trailingAnchor.constraint(equalTo: containerNav.trailingAnchor)
            
        ])
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: Helper.createTwoColumnViewFlowLayout(view))
        collectionView.register(GuestsCell.self, forCellWithReuseIdentifier: GuestsCell.cellID)
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.addSubview(refreshControl)
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: containerNav.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension GuestViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let guest = dataSource.items[indexPath.row]
        
        store.fetchImage(for: guest) { [weak self] result in
            guard let self = self else { return }
            
            guard
                let guestIndex = self.dataSource.items.index(of: guest),
                case let .success(image) = result else {
                return
            }
            
            let guestIndexPath = IndexPath(item: guestIndex, section: 0)
            
            if let cell = collectionView.cellForItem(at: guestIndexPath) as? GuestsCell {
                cell.update(with: image)
            }
        }
    }
}
