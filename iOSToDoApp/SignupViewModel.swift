//
//  SignupViewModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RxSwift

class SignupViewModel {
    var delegate: SignupCoordinatorDelegate!
    //input
    var name = Variable<String?>(nil)
    var email = Variable<String?>(nil)
    var password = Variable<String?>(nil)
    var birthday = Variable<String?>(nil)
    var gender = Variable<String?>(nil)
    
    init() {
        
    }
}
