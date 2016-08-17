//
//  NavViewController.swift
//  Amorization Schedule
//
//  Created by James Brown on 8/16/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!]

    }

}
