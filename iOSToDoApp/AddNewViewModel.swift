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
    var tapDone = PublishSubject<Void>()//true if update
    var isUpdate = false
    var todoId: String?

//    var isEditMode = false
    //output

    var canDone: Driver<Bool>
    var todoRepo = TodoRepository()

    //
    let bag = DisposeBag()
    init() {
        canDone = Observable.combineLatest(title.asObservable(), desc.asObservable()) {
            if $0 == nil || $1 == nil {
                return false
            }
            return $0!.characters.count > 0 && $1!.characters.count > 0
        }.asDriver(onErrorJustReturn: false)
        
        tapDone.asObservable().debug().subscribe(onNext: {
            //checking valid data
            //add data to db
            let item = TodoModel()
            if (self.todoId != nil) {
                item.todoId = self.todoId!
            }
            item.email = UserDefaultHandler.loggedEmail
            item.title = self.title.value
            item.desc = self.desc.value
            item.date = self.date.value
            item.time = self.time.value
            item.allDay = self.allday.value
            item.location = self.location.value

            if !self.isUpdate {
                self.todoRepo.add(item)
            } else {
                self.todoRepo.update(item)
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
