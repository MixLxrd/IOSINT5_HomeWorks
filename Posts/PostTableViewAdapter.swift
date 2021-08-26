//
//  PostTableViewAdapter.swift
//  Navigation
//
//  Created by Михаил Ильченко on 05.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//
/*

import UIKit

class PostTableViewAdapter: NSObject, UITableViewDataSource {
    
    var posts: [UserPost] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        
        let post = posts[indexPath.row]
        cell.configure(post: post)
        
        return cell
    }
    
    
    
}

extension PostTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}

 */
