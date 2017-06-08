//
//  UserDefaultHandler.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class UserDefaultHandler {
    class var isLogged: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "logged")
        }
        set(logged){
            UserDefaults.standard.set(logged, forKey: "logged")
        }
    }
    class var loggedEmail: String? {
        get {
            return UserDefaults.standard.string(forKey: "logged_email")
        }
        set(logged_email){
            UserDefaults.standard.set(logged_email, forKey: "logged_email")
        }
    }
}
