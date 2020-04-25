//
//  LoginView.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
    func presentToNext(name: String)
    func presentToCheck(palindrome: String)
}

class LoginView: UIView {
    // 217, 125, 64
    let headerImageView = UIImageView(imageView: #imageLiteral(resourceName: "bg_bright").withRenderingMode(.alwaysTemplate), cornerRadius: 0, tint: #colorLiteral(red: 0.812775088, green: 0.4669747984, blue: 0.2364412719, alpha: 1))
    let headerLbl = UILabel(headerText: "Welcome", color: .white, fontSize: 20)
    let bodyLbl = UILabel(bodyText: "This is app for suitmedia mobile developer test", color: .white, fontSize: 16)
    let profileImageView = UIImageView(imageView: #imageLiteral(resourceName: "img_avatar"), cornerRadius: 0, tint: nil)
    let nameTextField = UITextField(inputText: "Type name here", cornerRadius: 20)
    let palindromeTextField = UITextField(inputText: "Type text palindrome", cornerRadius: 20)
    let containerView = UIView(color: .white, cornerRadius: 10)
    let nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        let attributeTitle = NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        btn.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.6159868648, blue: 0.4593245133, alpha: 1)
        btn.isEnabled = false
        btn.layer.cornerRadius = 20
        btn.setAttributedTitle(attributeTitle, for: .normal)
        return btn
    }()
    let checkBtn: UIButton = {
        let btn = UIButton(type: .system)
        let attributeTitle = NSAttributedString(string: "Check", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        btn.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.6159868648, blue: 0.4593245133, alpha: 1)
        btn.isEnabled = false
        btn.layer.cornerRadius = 20
        btn.setAttributedTitle(attributeTitle, for: .normal)
        return btn
    }()
    let copyrightLbl = UILabel(headerText: "Copyright ⓒ 2020 Suitmedia All rights reserved.", color: .lightGray, fontSize: 12)
    
    var delegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nameTextField.addTarget(self, action: #selector(handleTextInput), for: .editingChanged)
        palindromeTextField.addTarget(self, action: #selector(handleTextInput), for: .editingChanged)
        palindromeTextField.autocapitalizationType = .none
        
        nextBtn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        checkBtn.addTarget(self, action: #selector(handleCheck), for: .touchUpInside)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTextInput(_ textField: UITextField) {
        guard let nameTextField = nameTextField.text else { return }
        guard let palindromeTextField = palindromeTextField.text else { return }
        let isTextValid = nameTextField.count > 0 && palindromeTextField.count > 0
        
        if isTextValid {
            nextBtn.isEnabled = true
            checkBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor.orangeSuit
            checkBtn.backgroundColor = UIColor.orangeSuit
        } else {
            nextBtn.isEnabled = false
            checkBtn.isEnabled = false
            nextBtn.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.6159868648, blue: 0.4593245133, alpha: 1)
            checkBtn.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.6159868648, blue: 0.4593245133, alpha: 1)
        }
    }
    
    @objc private func handleNext() {
        guard let nameTextField = nameTextField.text else { return }
        delegate?.presentToNext(name: nameTextField)
    }
    
    @objc private func handleCheck() {
        guard let palindromeTextField = palindromeTextField.text?.lowercased() else { return }
        delegate?.presentToCheck(palindrome: palindromeTextField)
    }
    
    private func configure() {
        backgroundColor = .white
        
        [headerImageView, headerLbl, bodyLbl, containerView, copyrightLbl].forEach({ v in
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)
        })
        
        
        [profileImageView, nameTextField, palindromeTextField, nextBtn, checkBtn].forEach({ v in
            v.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(v)
        })
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 220),
            
            headerLbl.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            headerLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLbl.heightAnchor.constraint(equalToConstant: 20),
            
            bodyLbl.topAnchor.constraint(equalTo: headerLbl.bottomAnchor, constant: 6),
            bodyLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            bodyLbl.heightAnchor.constraint(equalToConstant: 20),
            
            containerView.topAnchor.constraint(equalTo: bodyLbl.bottomAnchor, constant: 34),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 340),
            
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 23),
            profileImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            
            nameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            palindromeTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 14),
            palindromeTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            palindromeTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            palindromeTextField.heightAnchor.constraint(equalToConstant: 44),
            
            nextBtn.topAnchor.constraint(equalTo: palindromeTextField.bottomAnchor, constant: 25),
            nextBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            nextBtn.heightAnchor.constraint(equalToConstant: 40),
            nextBtn.widthAnchor.constraint(equalToConstant: 150),
            
            checkBtn.topAnchor.constraint(equalTo: palindromeTextField.bottomAnchor, constant: 25),
            checkBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            checkBtn.heightAnchor.constraint(equalToConstant: 40),
            checkBtn.widthAnchor.constraint(equalToConstant: 100),
            
            copyrightLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            copyrightLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            copyrightLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            copyrightLbl.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
}
