//
//  AddNewViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class AddNewViewController: UIViewController {

    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var btnClose: UIBarButtonItem!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    var viewModel: AddNewViewModel!

    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        btnClose.rx.tap.subscribe(onNext: {
            print("SADasd")
            self.navigationController?.popViewController(animated: true)
        }).addDisposableTo(bag)
        btnDone.rx.tap.bind(to: viewModel.tapDone).addDisposableTo(bag)
    }
}
