//
//  AddNewViewModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/5/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

class AddNewViewModel {
    var delegate: AddNewCoordinatorDelegate!
    //input
    var title = Variable<String?>(nil)
    var desc = Variable<String?>(nil)
    var date = Variable<String?>(nil)
    var time = Variable<String?>(nil)
    var location = Variable<String?>(nil)
    var allday = Variable<Bool>(false)

    var tapDone = PublishSubject<Void>()
    //output
    
    var canDone: Driver<Bool>
    
    //
    let bag = DisposeBag()
    init() {
        canDone = Observable.combineLatest(title.asObservable(), desc.asObservable()) {
            return $0!.characters.count > 0 && $1!.characters.count > 0
        }.asDriver(onErrorJustReturn: false)
        
        let realm = try! Realm()
        tapDone.asObserver().subscribe(onNext: {
            //checking valid data
            //add data to db
            let item = TodoModel()
            item.title = self.title.value
            item.desc = self.desc.value
            item.date = self.date.value
            item.time = self.time.value
            item.allDay = self.allday.value
            item.location = self.location.value
            try! realm.write {
                realm.add(item)
            }
            //back to main coordinator
            self.delegate.backToHomeAndReload()

        }).addDisposableTo(bag)
    }
}

func existNil(strs: String?...) -> Bool {
    for str in strs {
        if str == nil {
            return true
        }
    }
    return false
}
