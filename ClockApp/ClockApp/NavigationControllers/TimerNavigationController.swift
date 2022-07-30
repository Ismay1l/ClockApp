//
//  TimerNavigationController.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 22.07.22.
//

import UIKit

class TimerNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tc = TimerViewController()
        self.viewControllers = [tc]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        tc.navigationItem.title = "Timer"
    }
}
