//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Ильченко on 06.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var posts: [UserPost] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private lazy var fullSizeAvatar: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "waiter")
        image.contentMode = .scaleToFill
        image.alpha = 0
        image.toAutoLayout()
        return image
    }()
    
    private lazy var backgroundAvatar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.toAutoLayout()
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.image = #imageLiteral(resourceName: "waiter")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var closeImageView: UIImageView = {
        let image = UIImageView()
        let tapAvatar = UITapGestureRecognizer(target: self, action: #selector(tapDown))
        image.addGestureRecognizer(tapAvatar)
        image.isUserInteractionEnabled = true
        tapAvatar.delegate = self
        image.image = #imageLiteral(resourceName: "close")
        image.toAutoLayout()
        return image
    }()
    
    @objc func tapUp() {
        print("avatar appear")
        let someOffset = profileHeaderView.avatarImage.frame
        print(someOffset)
        view.addSubview(imageView)
        imageView.frame = .init(x: someOffset.minX, y: someOffset.minY+20, width: someOffset.width, height: someOffset.height)
        exampleLayout()
        let newOffeset = fullSizeAvatar.frame
        print(newOffeset)
        UIView.animate(withDuration: 0.5) {
            self.backgroundAvatar.alpha = 0.5
            self.fullSizeAvatar.alpha = 1
            self.imageView.frame = newOffeset
        }
        
        
    }
    
    
    private func exampleLayout() {
        view.addSubview(backgroundAvatar)
        view.addSubview(fullSizeAvatar)
        view.addSubview(closeImageView)
        backgroundAvatar.alpha = 0
        fullSizeAvatar.alpha = 0
        
        
        let constraints = [
            
            
            backgroundAvatar.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundAvatar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundAvatar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
            fullSizeAvatar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullSizeAvatar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fullSizeAvatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fullSizeAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            closeImageView.heightAnchor.constraint(equalToConstant: 16),
            closeImageView.widthAnchor.constraint(equalToConstant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    @objc func tapDown() {
        print("avatar disappear")
        UIView.animate(withDuration: 0.3) {
            
            self.fullSizeAvatar.removeFromSuperview()
            self.backgroundAvatar.removeFromSuperview()
            self.imageView.removeFromSuperview()
            self.closeImageView.removeFromSuperview()
            self.view.layoutIfNeeded()
        }
        
        
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    let profileHeaderView = ProfileTableHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .lightGray
        
        setupTableView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            self.posts = Post.userPosts
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
//        let tapAvatar = UITapGestureRecognizer(target: self, action: #selector(tapUp))
//        profileHeaderView.avatarImage.addGestureRecognizer(tapAvatar)
//        profileHeaderView.avatarImage.isUserInteractionEnabled = true
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
}

extension ProfileViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Post.userPosts.count)
        return Post.userPosts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            let post = Post.userPosts[indexPath.row - 1]
            cell.configure(post: post)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        return profileHeaderView
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return (UIScreen.main.bounds.width / 4 + 60) } else { return UITableView.automaticDimension }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 { let photosViewController = PhotosViewController()
            self.navigationController?.pushViewController(photosViewController, animated: true) }
        
    }
}


extension ProfileViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        gestureRecognizer is UITapGestureRecognizer
    }
}
