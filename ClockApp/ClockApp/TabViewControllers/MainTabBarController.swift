//
//  MainTabBarController.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 22.07.22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .black
        tabBar.tintColor = .systemYellow
        tabBar.barStyle = .default
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .black
        
        let worldClockNC = WorldClockNavigationController()
        worldClockNC.tabBarItem.title = "World Clock"
        worldClockNC.tabBarItem.image = UIImage(named: "world_grey")
        
        let alarmNC = AlarmNavigationController()
        alarmNC.tabBarItem.title = "Alarm"
        alarmNC.tabBarItem.image = UIImage(named: "alarm_grey")
        
        let stopwatchNC = StopwatchNavigationController()
        stopwatchNC.tabBarItem.title = "Stopwatch"
        stopwatchNC.tabBarItem.image = UIImage(named: "stopwatch_black")
        
        let timerNC = TimerNavigationController()
        timerNC.tabBarItem.title = "Timer"
        timerNC.tabBarItem.image = UIImage(named: "timer_black")
        
        self.viewControllers = [worldClockNC, alarmNC, stopwatchNC, timerNC]
        
        self.selectedIndex = 0
    }
}
