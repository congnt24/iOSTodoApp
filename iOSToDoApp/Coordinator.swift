//
//  Coordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    var coordinators = [String: Any]()
    var navigation: UINavigationController?
    var window: UIWindow?
    //must init storyboard in AppDelegate
    var mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    init(_ navigation: UINavigationController?, _ window: UIWindow? = nil) {
        self.window = window
        self.navigation = navigation
    }
    
    func start() {
        
    }
}
