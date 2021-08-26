//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Михаил Ильченко on 15.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let labelPhotos: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.tintColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let firstPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.roundCornerWithRadius(6)
        //imageView.contentMode = .scaleAspectFill
        imageView.image = Photos.photos[0]
        imageView.toAutoLayout()
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let secondPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.roundCornerWithRadius(6)
        imageView.clipsToBounds = true

        //imageView.contentMode = .scaleToFill
        imageView.image = Photos.photos[1]
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let thirdPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.roundCornerWithRadius(6)
        imageView.clipsToBounds = true

        //imageView.contentMode = .scaleToFill
        imageView.image = Photos.photos[2]
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let fourthPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.roundCornerWithRadius(6)
        imageView.clipsToBounds = true

        //imageView.contentMode = .scaleToFill
        imageView.image = Photos.photos[3]
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: String("arrow"))
        imageView.toAutoLayout()
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayout()
    }
    
}


private extension PhotosTableViewCell {
    func setupLayout() {
        contentView.addSubview(labelPhotos)
        contentView.addSubview(firstPhotoImageView)
        contentView.addSubview(secondPhotoImageView)
        contentView.addSubview(thirdPhotoImageView)
        contentView.addSubview(fourthPhotoImageView)
        contentView.addSubview(arrowImageView)
        
        
        print(contentView.frame.width)
        print(contentView.bounds.width)
        
        let constraints = [
            labelPhotos.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            labelPhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            labelPhotos.heightAnchor.constraint(equalToConstant: 24),
            
            firstPhotoImageView.topAnchor.constraint(equalTo: labelPhotos.bottomAnchor, constant: 12),
            firstPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            firstPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            firstPhotoImageView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4 ),
            firstPhotoImageView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            
            secondPhotoImageView.leadingAnchor.constraint(equalTo: firstPhotoImageView.trailingAnchor, constant: 8),
            secondPhotoImageView.topAnchor.constraint(equalTo: labelPhotos.bottomAnchor, constant: 12),
            secondPhotoImageView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            secondPhotoImageView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            secondPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            thirdPhotoImageView.leadingAnchor.constraint(equalTo: secondPhotoImageView.trailingAnchor, constant: 8),
            thirdPhotoImageView.topAnchor.constraint(equalTo: labelPhotos.bottomAnchor, constant: 12),
            thirdPhotoImageView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            thirdPhotoImageView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            thirdPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            fourthPhotoImageView.topAnchor.constraint(equalTo: labelPhotos.bottomAnchor, constant: 12),
            fourthPhotoImageView.leadingAnchor.constraint(equalTo: thirdPhotoImageView.trailingAnchor, constant: 8),
            fourthPhotoImageView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            fourthPhotoImageView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            fourthPhotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            fourthPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            arrowImageView.centerYAnchor.constraint(equalTo: labelPhotos.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24),
            arrowImageView.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
