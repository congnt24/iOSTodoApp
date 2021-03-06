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
    override func start(_ data: Any?) {
        //handle first activity to start
        //check if user is logged
        if (UserDefaultHandler.isLogged) {
            showHomeCoordinator()
        } else {
            LoginCoordinator(navigation).start(nil)
        }
    }
}

extension AppCoordinator: DidFinishHomCoordinator {
    func showHomeCoordinator() {
        HomeCoordinator(navigation).start(nil)
    }
    func didFinishHomCoordinator() {

    }
}
extension AppCoordinator {
    func showSignupCoordinator() {
        SignupCoordinator(navigation).start(nil)
    }
}
