//
//  UserDefaultHelper.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 23.07.22.
//

import Foundation

class UserdefaultHelper {
    
    static var shared = UserdefaultHelper()
    
    let userDefaults = UserDefaults()
    
    func setCountryTime(name: String, time: String) {
        userDefaults.set(name, forKey: "Country")
        userDefaults.set(time, forKey: "Time")
    }
    
    func getCountry() -> String{
        if let name = userDefaults.string(forKey: "Country") {
            return name
        }
        return ""
    }
    
    func getTime() -> String{
        if let time = userDefaults.string(forKey: "Time") {
            return time
        }
        return ""
    }
    
    func removeAllObjects() {
        userDefaults.removeObject(forKey: "Country")
        userDefaults.removeObject(forKey: "Time")
    }
}
