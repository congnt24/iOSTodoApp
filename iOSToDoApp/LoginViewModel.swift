//
//  LoginViewModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    //Input
    var username = Variable("")
    var password = Variable("")
    var btnSignin = Variable<Void>()
    var btnSignup = Variable<Void>()
    //Output
    //example: is enable signin button, we use driver of observalbe. Driver is observable with relay = 1, and retry = 3?? i'm not sure.
    var enableSignin: Driver<Bool>

    //RX
    var bag = DisposeBag()
    init(delegate: LoginCoordinatorDelegate!
    ) {
        //Observable<Bool>
        enableSignin = Observable.combineLatest(username.asObservable(), password.asObservable()) { (user, pass) -> Bool in
            return user.characters.count > 0 && pass.characters.count > 0
        }.asDriver(onErrorJustReturn: false)
        //handle tab signin
        btnSignin.asObservable().skip(1).subscribe(onNext: { delegate.showHome() }).addDisposableTo(bag)
        btnSignup.asObservable().skip(1).subscribe(onNext: { delegate.showSignup() }).addDisposableTo(bag)
    }

}
