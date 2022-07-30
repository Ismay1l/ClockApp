//
//  StopwatchNavigationController.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 22.07.22.
//

import UIKit

class StopwatchNavigationController: UINavigationController,
                                     UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sc = StopWatchViewController()
        self.viewControllers = [sc]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        sc.navigationItem.title = "Stopwatch"
    }
}
