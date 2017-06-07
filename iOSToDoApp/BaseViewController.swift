//
//  BaseViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController: UIViewController {
    var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        responseFromViewModel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func bindToViewModel() { }
    func responseFromViewModel() { }
}
