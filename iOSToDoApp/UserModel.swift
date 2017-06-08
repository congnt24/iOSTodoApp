//
//  UserModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: Object {
    dynamic var name: String?
    dynamic var email: String?
    dynamic var password: String?
    dynamic var birthday: String?
    dynamic var gender: String?
    
    override class func primaryKey() -> String? {
        return "email"
    }
}
