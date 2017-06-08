//
//  HomeViewModel.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift
import RxRealm

class HomeViewModel {
    var delegate: HomeCoordinatorDelegate
    //input
    var addNew = Variable<Void>()
    var deleteItem = Variable<IndexPath?>(nil)
    var selectedItem = Variable<IndexPath?>(nil)
    //output
    var datas = Variable<[TodoModel]>([])
//    var datas2: Driver<[TodoModel]>
    var todoRepo: TodoRepository
    let bag = DisposeBag()
    //retrieve data from realm db

    init(delegate: HomeCoordinatorDelegate) {
        self.delegate = delegate
        todoRepo = TodoRepository()
        loadData()
        setupRx()
    }
    
    func setupRx() {
        //handle remove item
        selectedItem.asObservable().filter({ $0 != nil }).subscribe(onNext: { (ip) in
            //open addnew for editing
            self.delegate.showAddNewUpdate(data: self.datas.value[(ip?.item)!])
        }).addDisposableTo(bag)
        
        deleteItem.asObservable().filter({ $0 != nil }).subscribe(onNext: {
            self.todoRepo.delete(self.datas.value[$0!.item])
        }).addDisposableTo(bag)
        addNew.asObservable().skip(1).subscribe(onNext: {
            self.delegate.showAddNew()
        }).addDisposableTo(bag)
    }

    func loadData() {
        Observable.collection(from: todoRepo.getAll()).map {
            Array($0)
        }.bind(to: datas).addDisposableTo(bag)

    }
}
