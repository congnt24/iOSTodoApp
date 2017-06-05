//
//  SignupCoordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

class SignupCoordinator: Coordinator {
    override func start() {
        let signup = mainStoryboard.instantiateViewController(withIdentifier: "signup")

        navigation?.pushViewController(signup, animated: true)
    }
}
