//
//  LoginCoordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

protocol DidFinishLoginCoordinator {
    func didFinishLoginCoordinator()
}
protocol LoginCoordinatorDelegate {
    func showSignup()
    func showHome()
}

class LoginCoordinator: Coordinator {
    override func start(_ data: Any?) {
        let login = mainStoryboard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        let viewModel = LoginViewModel()
        viewModel.delegate = self
        login.viewModel = viewModel
        navigation?.setViewControllers([login], animated: true)
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func showHome() {
        HomeCoordinator(navigation).start(nil)
    }
    func showSignup() {
        SignupCoordinator(navigation).start(nil)
    }
}
