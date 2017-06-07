//
//  LoginViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var fieldUsername: FieldView!
    @IBOutlet weak var fieldPassword: FieldView!

    var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //setup view
        fieldPassword.textField.isSecureTextEntry = true
        //bind data to view model
        fieldUsername.textField.rx.text.orEmpty.bind(to: viewModel.username).addDisposableTo(bag)
        fieldPassword.textField.rx.text.orEmpty.bind(to: viewModel.password).addDisposableTo(bag)
//        btnSignIn.rx.tap
        btnSignIn.rx.tap.bind(to: viewModel.btnSignin).addDisposableTo(bag)
        btnSignUp.rx.tap.bind(to: viewModel.btnSignup).addDisposableTo(bag)
        viewModel.enableSignin.drive(onNext: { (enable) in
            self.btnSignIn.isEnabled = enable
        }).addDisposableTo(bag)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func responseFromViewModel() {
        viewModel.signinSuccess.asObservable().subscribe(onNext: {
            if $0 {
                UserDefaultHandler.isLogged = true
                UserDefaultHandler.loggedEmail = self.fieldUsername.textField.text
                self.viewModel.delegate.showHome()
            } else {
                self.showMessageDialog("Oops", "Login Failed")
            }
        }).addDisposableTo(bag)
    }

}
