//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Михаил Ильченко on 05.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//



import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: UserPost? {
        didSet {
            guard let post = post else { return }
            authorLabel.text = post.author
            descriptionLabel.text = post.description
            postImageView.image = post.image
            likesLabel.text = "Likes: " + String(post.likes)
            viewsLabel.text = "Views: " + String(post.views)
        }
    }
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.toAutoLayout()
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        //label.contentMode = .scaleAspectFit
        label.toAutoLayout()
        return label
    }()
    
    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.toAutoLayout()

        return imageView
    }()
    
    private var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayoutCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayoutCell()
    }
    
    func configure(post: UserPost) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        postImageView.image = post.image
        likesLabel.text = "Likes: " + String(post.likes)
        viewsLabel.text = "Views: " + String(post.views)
    }
    
}

// MARK: Layout
private extension PostTableViewCell {
    
    func setupLayoutCell() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        let constraints = [
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

