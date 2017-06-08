//
//  TodoRepository.swift
//  iOSToDoApp
//
//  Created by Cong on 6/5/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm

class TodoRepository: Repository<TodoModel> {
    override func getAll() -> Results<TodoModel> {
        return super.getAll().filter(NSPredicate(format: "email == %@", UserDefaultHandler.loggedEmail!))
    }
}
