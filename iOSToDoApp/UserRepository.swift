//
//  UserRepository.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class UserRepository: Repository<UserModel> {
    //check for duplicate email
    override func add(_ t: UserModel) -> Bool {
        if let _ = realm.object(ofType: UserModel.self, forPrimaryKey: t.email) {
            return false
        }
        return super.add(t)
    }
    
    func checkValid(_ t: UserModel) -> Bool {
        if realm.objects(UserModel.self).filter({ $0.email == t.email && $0.password == t.password }).count > 0 {
            return true
        }
        return false
    }
}
