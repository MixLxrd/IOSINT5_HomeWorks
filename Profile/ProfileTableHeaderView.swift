//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Михаил Ильченко on 04.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

protocol ProfileTableHeaderViewDelegate: AnyObject {
    func onShowOffer()
}

class ProfileTableHeaderView: UIView {
    
    weak var delegate: ProfileTableHeaderViewDelegate?

    private let nicknameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.text = "Hipster Waiter"
            label.toAutoLayout()
            return label
        }()
        
        private lazy var statusTextField: UITextField = {
            let textField = UITextField()
            textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            textField.textColor = .gray
            textField.text = "Waiting for something..."
            textField.toAutoLayout()
            return textField
        }()

        private lazy var changeTextField: UITextField = {
            let textField = UITextField()
            textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textField.textColor = .black
            textField.text = "  Waiting for something"
            textField.backgroundColor = .white
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.cornerRadius = 12
            textField.toAutoLayout()
            return textField
        }()
        
        private lazy var showStatusButton: UIButton = {
            let button = UIButton(type: .system)
            
            button.layer.cornerRadius = 4 //закругление
            button.layer.shadowOffset = CGSize(width: 4, height: 4) //??
            button.layer.shadowRadius = 4 //тень закруглений?
            button.layer.shadowColor = UIColor.black.cgColor // цвет тени
            button.layer.shadowOpacity = 0.7 //прозрачность тени
            
            button.backgroundColor = .blue
            button.setTitle("Show status", for: .normal)
            button.setTitleColor(.white, for: .normal)
            
            button.addTarget(self, action: #selector(showStatusButtonPressed), for: .touchUpInside)
            button.toAutoLayout()
            return button
        }()
        
        lazy var avatarImage: UIImageView = {
            let image = UIImageView()
            image.layer.borderWidth = 3
            image.layer.cornerRadius = 50
            image.clipsToBounds = true
            image.layer.borderColor = UIColor.white.cgColor
            image.image = #imageLiteral(resourceName: "waiter")
            image.contentMode = .scaleToFill
            
            image.toAutoLayout()
            return image
        }()

        
    
        
    
        @objc private func showStatusButtonPressed() {
            statusTextField.text = changeTextField.text
            //print("You tap the button. I'm do nothing")
        }
        
        @objc private func nicknameChanged(_ textField: UITextField) {
            nicknameLabel.text = statusTextField.text
        }
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            

            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        

    
    
        override func layoutSubviews() {
            super.layoutSubviews()
        }
 
        func setupViews() {
            addSubview(nicknameLabel)
            addSubview(statusTextField)
            addSubview(showStatusButton)
            addSubview(changeTextField)
            addSubview(avatarImage)

            let constraints = [
                
                nicknameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
                nicknameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
                nicknameLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -30),
                
                avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                avatarImage.widthAnchor.constraint(equalToConstant: 100),
                avatarImage.heightAnchor.constraint(equalToConstant: 100),
                
                
                statusTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
                statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusTextField.bottomAnchor.constraint(equalTo: changeTextField.topAnchor, constant: -8),
                
                changeTextField.leadingAnchor.constraint(equalTo: statusTextField.leadingAnchor),
                changeTextField.heightAnchor.constraint(equalToConstant: 40),
                changeTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                changeTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -8),
                
                
                showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                showStatusButton.heightAnchor.constraint(equalToConstant: 50),
                showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ]
            
            NSLayoutConstraint.activate(constraints)

            

            
        }
    
}

