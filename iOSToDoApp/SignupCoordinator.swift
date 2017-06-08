//
//  SignupCoordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

protocol SignupCoordinatorDelegate {
    func showHome()
}

class SignupCoordinator: Coordinator {
    override func start(_ data: Any?) {
        let signup = mainStoryboard.instantiateViewController(withIdentifier: "signup") as! SignupViewController
        let viewModel = SignupViewModel()
        viewModel.delegate = self
        signup.viewModel = viewModel
        navigation?.pushViewController(signup, animated: true)
    }
}

extension SignupCoordinator: SignupCoordinatorDelegate {
    func showHome() {
        HomeCoordinator(navigation).start(nil)
    }
}
