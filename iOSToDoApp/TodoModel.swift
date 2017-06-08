//
//  TodoModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel: Object {
    dynamic var todoId = UUID().uuidString
    dynamic var email: String?
    dynamic var title: String?
    dynamic var desc: String?
    dynamic var date: String?
    dynamic var time: String?
    dynamic var allDay: Bool = false
    dynamic var location: String?
    
    override class func primaryKey() -> String? {
        return "todoId"
    }
}
