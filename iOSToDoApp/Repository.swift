//
//  Repository.swift
//  iOSToDoApp
//
//  Created by Cong on 6/5/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RealmSwift

class Repository<T: Object> {
    var realm: Realm
    init() {
        realm = try! Realm()
    }
    
    func getAll() -> Results<T>{
        return realm.objects(T.self)
    }
    
}
protocol RepositoryDelegate {
    associatedtype T: Object
    
    func add(_ t: T)
    func delete(_ t: T)
    func update(_ t: T)
}
