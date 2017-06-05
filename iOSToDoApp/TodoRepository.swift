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

class TodoRepository: Repository<TodoModel>, RepositoryDelegate {
    typealias T = TodoModel

    func add(_ t: TodoModel) {
        try! realm.write {
            realm.add(t)
        }
    }
    
    func delete(_ t: TodoModel) {
        try! realm.write {
            realm.delete(t)
        }
    }
    
    func update(_ t: TodoModel) {
        try! realm.write {
            realm.add(t, update: true)
        }
    }
}
