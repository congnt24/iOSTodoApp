//
//  AppCoordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        //handle first activity to start
        //check if user is logged
        if (UserDefaults.standard.value(forKey: "logged") != nil) {
            
        }
    }
}
