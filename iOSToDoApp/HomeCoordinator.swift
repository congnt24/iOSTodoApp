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
protocol HomeCoordinatorDelegate {
    func showAddNew()

}
class HomeCoordinator: Coordinator {
    override func start() {
        let home = mainStoryboard.instantiateViewController(withIdentifier: "home") as! HomeViewController
        //create and assign view model
        //create and assign delegate = self
        //push navigation
        let viewModel = HomeViewModel(delegate: self)
        viewModel.delegate = self
        home.viewModel = viewModel
        navigation?.popToRootViewController(animated: false)
        navigation?.setViewControllers([home], animated: false)
//        navigation?.pushViewController(home, animated: true)
    }
}

//extension delegate
extension HomeCoordinator: HomeCoordinatorDelegate {
    func showAddNew() {
        AddNewCoordinator(navigation).start()
    }
}

