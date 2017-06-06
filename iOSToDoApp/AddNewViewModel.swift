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
    var title: String?
    var desc: String?
    var date: String?

    var tapDone = PublishSubject<Void>()
    //output
    //
    let bag = DisposeBag()
    init() {
        let realm = try! Realm()
        tapDone.asObserver().subscribe(onNext: {
            //checking valid data
            if !existNil(strs: self.title, self.desc, self.date) {
                //add data to db
                let item = TodoModel()
                item.title = self.title
                item.desc = self.desc
                item.time = self.date
                try! realm.write {
                    realm.add(item)
                }
                //back to main coordinator
                self.delegate.backToHomeAndReload()
            }
        }).addDisposableTo(bag)
    }
}

func existNil(strs: String?...) -> Bool{
    for str in strs {
        if str == nil {
            return true
        }
    }
    return false
}
