//
//  SignupViewModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SignupViewModel {
    var delegate: SignupCoordinatorDelegate!
    //input
    var name = Variable<String?>(nil)
    var email = Variable<String?>(nil)
    var password = Variable<String?>(nil)
    var birthday = Variable<String?>(nil)
    var gender = Variable<String?>(nil)
    var tapDone = Variable<Void>()

    //output: to notify for view change state
    var enableDone: Driver<Bool>
    var signupSuccess = PublishSubject<Bool>()

    //General variables
    let userRepo = UserRepository()
    let bag = DisposeBag()

    init() {
        enableDone = Observable.combineLatest([name.asObservable(), email.asObservable(), password.asObservable(), birthday.asObservable(), gender.asObservable()], {
            for item in $0 {
                if item!.characters.count == 0 { // if error return false -> dont need to care about nil
                    return false
                }
            }
            return true
        }).asDriver(onErrorJustReturn: false)

        tapDone.asObservable().skip(1).debounce(0.3, scheduler: MainScheduler.instance).subscribe(onNext: {
            self.signupSuccess.onNext(self.userRepo.add(self.checkValidateAndGenerateModel()))
        }).addDisposableTo(bag)
        
    }

    func checkValidateAndGenerateModel() -> UserModel {
        //We can use regex to check valid for email, password here
        let model = UserModel()
        model.name = name.value
        model.email = email.value
        model.password = password.value
        model.birthday = birthday.value
        model.gender = gender.value
        return model
    }
}
