//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Михаил Ильченко on 15.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: UIImage? {
        didSet {
            guard let photo = photo else { return }
            photoImageView.image = photo
        }
    }
    
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.contentMode = .scaleAspectFit
        imageView.toAutoLayout()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.roundCornerWithRadius(6)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension PhotosCollectionViewCell {
    
    func setupLayout() {
        contentView.addSubview(photoImageView)
        
        let constraints = [
            
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            //photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            //photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //photoImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            //photoImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
