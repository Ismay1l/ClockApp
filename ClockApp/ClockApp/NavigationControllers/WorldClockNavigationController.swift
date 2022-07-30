//
//  WorldClockNavigationController.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 22.07.22.
//

import UIKit

class WorldClockNavigationController: UINavigationController,
                                      UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wc = WorldClockController()
        self.viewControllers = [wc]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        wc.navigationItem.title = "World Clock"
    }
}
