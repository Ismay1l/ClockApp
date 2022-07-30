//
//  AlarmNavigationController.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 22.07.22.
//

import UIKit

class AlarmNavigationController: UINavigationController,
                                 UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ac = AlarmViewController()
        self.viewControllers = [ac]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        ac.navigationItem.title = "Alarm"
    }
}
