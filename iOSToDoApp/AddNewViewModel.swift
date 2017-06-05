//
//  AddNewViewModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/5/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class AddNewViewModel {
    var delegate: AddNewCoordinatorDelegate!
    //input
    var title = Variable("title")
    var desc = Variable("desc")
    var time = Variable("time")

    var tapDone = PublishSubject<Void>()
    //output
    //
    let bag = DisposeBag()
    init() {
        let realm = try! Realm()
        tapDone.asObserver().subscribe(onNext: {
            //add data to db
            let item = TodoModel()
            item.title = self.title.value
            item.desc = self.desc.value
            item.time = self.time.value
            try! realm.write {
                realm.add(item)
            }
            //back to main coordinator
            self.delegate.backToHomeAndReload()
        }).addDisposableTo(bag)
    }
}
