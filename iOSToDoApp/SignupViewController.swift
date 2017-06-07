//
//  SignupViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignupViewController: UIViewController {
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var nameField: FieldView!
    @IBOutlet weak var emailField: FieldView!
    @IBOutlet weak var passwordField: FieldView!
    @IBOutlet weak var birthdayField: FieldView!
    @IBOutlet weak var genderField: FieldView!
    
    var viewModel: SignupViewModel!
    
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        back.rx.tap.subscribe(onNext: {
            self.navigationController?.popViewController(animated: true)
        }).addDisposableTo(bag)
        btnDone.rx.tap.subscribe(onNext: {
            self.viewModel.delegate.showHome()
        }).addDisposableTo(bag)
    }

}
