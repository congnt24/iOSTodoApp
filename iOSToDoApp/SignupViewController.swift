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

class SignupViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var nameField: FieldView!
    @IBOutlet weak var emailField: FieldView!
    @IBOutlet weak var passwordField: FieldView!
    @IBOutlet weak var birthdayField: FieldView!
    @IBOutlet weak var genderField: FieldView!
    @IBOutlet weak var btnCamera: UIButton!
    
    //MARK: - handle camera
    @IBAction func onClickCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        btnCamera.setImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: UIControlState.normal)
        dismiss(animated: true, completion: nil)
    }
    
    var viewModel: SignupViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        back.rx.tap.subscribe(onNext: {
            self.navigationController?.popViewController(animated: true)
        }).addDisposableTo(bag)
    }

    override func bindToViewModel(){
        nameField.textField.rx.text.bind(to: viewModel.name).addDisposableTo(bag)
        emailField.textField.rx.text.bind(to: viewModel.email).addDisposableTo(bag)
        passwordField.textField.rx.text.bind(to: viewModel.password).addDisposableTo(bag)
        birthdayField.textField.rx.text.bind(to: viewModel.birthday).addDisposableTo(bag)
        genderField.textField.rx.text.bind(to: viewModel.gender).addDisposableTo(bag)
        
        btnDone.rx.tap.bind(to: viewModel.tapDone).addDisposableTo(bag)
    }
    override func responseFromViewModel() {
        viewModel.enableDone.drive(onNext: {
            self.btnDone.isEnabled = $0
        }).addDisposableTo(bag)
        
        
        viewModel.signupSuccess.asObservable().subscribe(onNext: {
            if $0 {
                UserDefaultHandler.loggedEmail = self.emailField.textField.text
                UserDefaultHandler.isLogged = true
                self.viewModel.delegate.showHome()
            } else {
                self.showMessageDialog("Oops", "Something went wrong.")
            }
        }).addDisposableTo(bag)
    }
}
