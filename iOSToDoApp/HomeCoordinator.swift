//
//  HomeCoordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

protocol DidFinishHomCoordinator {
    func didFinishHomCoordinator()
}
class HomeCoordinator: Coordinator {
    override func start() {
        let home = mainStoryboard.instantiateViewController(withIdentifier: "home")
        //create and assign view model
        //create and assign delegate = self
        //push navigation
        navigation?.pushViewController(home, animated: true)
    }
}

//extension delegate

