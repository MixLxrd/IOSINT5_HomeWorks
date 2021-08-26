//
//  UIView+Autolayout.swift
//  Navigation
//
//  Created by Михаил Ильченко on 17.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
