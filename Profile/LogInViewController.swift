//
//  LogInViewController.swift
//  Navigation
//
//  Created by Михаил Ильченко on 17.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let loginImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.toAutoLayout()
        imageView.image = #imageLiteral(resourceName: "logo")
        return imageView
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        //textField.layer.cornerRadius = 10
        
        textField.roundCornerWithRadius(10, top: true, bottom: false, shadowEnabled: false)
        
        textField.leftView = UIView(frame: CGRect(x: textField.frame.minX, y: textField.frame.minY, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: textField.frame.minX, y: textField.frame.minY, width: 16, height: textField.frame.height))
        textField.rightViewMode = .always
        
        
        //textField.text = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        
        textField.tintColor = UIColor.init(named: "Color")
        textField.autocapitalizationType = .none
        
        textField.placeholder = "Email of phone"
        
        textField.toAutoLayout()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        //textField.layer.cornerRadius = 10
        
        textField.roundCornerWithRadius(10, top: false, bottom: true, shadowEnabled: false)
        textField.placeholder = "Password"
        
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = .blue
        textField.autocapitalizationType = .none
        
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: textField.frame.minX, y: textField.frame.minY, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: textField.frame.minX, y: textField.frame.minY, width: 16, height: textField.frame.height))
        textField.rightViewMode = .always
        
        textField.toAutoLayout()
        return textField
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        button.toAutoLayout()
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    @objc func buttonAction() {

        navigationController?.navigationBar.isHidden = false
        performSegue(withIdentifier: "toProfileView", sender: self)
 
      print("Button tapped")
    }
    
    private let contentView: UIView = {
            let view = UIView()
            view.toAutoLayout()
            return view
    }()
    
    private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.toAutoLayout()
            scrollView.showsVerticalScrollIndicator = false
            scrollView.delegate = self
            return scrollView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        navigationController?.navigationBar.isHidden = true
        
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    
    fileprivate func setupLayout() {
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            contentView.addSubview(loginImage)
            contentView.addSubview(loginTextField)
            contentView.addSubview(passwordTextField)
            contentView.addSubview(logInButton)

            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
            let constraints = [
                
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

                
 
                loginImage.heightAnchor.constraint(equalToConstant: 100),
                loginImage.widthAnchor.constraint(equalToConstant: 100),
                loginImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
                loginImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                
                loginTextField.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 120),
                loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                loginTextField.heightAnchor.constraint(equalToConstant: 50),
                
                
                passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
                passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                passwordTextField.heightAnchor.constraint(equalToConstant: 50),
                
                logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
                logInButton.heightAnchor.constraint(equalToConstant: 50),
                logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
                
                
            ]
            
            NSLayoutConstraint.activate(constraints)
 
        }
 
    // MARK: Keyboard actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

}

extension LogInViewController: UIScrollViewDelegate {
    func loginViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}


