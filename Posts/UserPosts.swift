//
//  UserPosts.swift
//  Navigation
//
//  Created by Михаил Ильченко on 04.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//



import UIKit

struct UserPost: Equatable {
    let author: String
    var description: String? = nil
    let image: UIImage
    let likes: Int
    let views: Int
}

 
