//
//  AddNewCoordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/5/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

protocol AddNewCoordinatorDelegate {
    func backToHomeAndReload()
}

class AddNewCoordinator: Coordinator {
    override func start(_ data: Any?) {
        let addNew = mainStoryboard.instantiateViewController(withIdentifier: "addnew") as! AddNewViewController
        let viewModel = AddNewViewModel()
        viewModel.delegate = self
        addNew.viewModel = viewModel
        addNew.data = data
        navigation?.pushViewController(addNew, animated: true)
    }
}

extension AddNewCoordinator: AddNewCoordinatorDelegate {
    func backToHomeAndReload() {
        navigation?.popViewController(animated: true)
    }
}
