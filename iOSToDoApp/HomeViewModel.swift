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
    var deleteItem = Variable<IndexPath>(IndexPath(row: 0, section: 0))
    //output
    var datas = Variable<[TodoModel]>([])
//    var datas2: Driver<[TodoModel]>

    let bag = DisposeBag()
    //retrieve data from realm db

    init(delegate: HomeCoordinatorDelegate) {
        self.delegate = delegate
        loadData()
        setupRx()
    }

    func setupRx() {
        //handle remove item
        deleteItem.asObservable().skip(1).subscribe(onNext: { _ in
            let realm = try! Realm()
            let items = realm.objects(TodoModel.self).first
            try! realm.write {
                realm.delete(items!)
            }
//            Observable.from(optional: items).subscribe(realm.rx.delete()).addDisposableTo(self.bag)
//            self.datas.value.remove(at: $0.row)
        }).addDisposableTo(bag)
        addNew.asObservable().skip(1).subscribe(onNext: {
            self.delegate.showAddNew()
        }).addDisposableTo(bag)
    }

    func loadData() {
        //retreive object from realm db
        let realm = try! Realm()
        let items = realm.objects(TodoModel.self)
//        datas.value = Array(items)
        Observable.collection(from: items).map {
            Array($0)
        }.asObservable().bind(to: datas).addDisposableTo(bag)
//        Observable.from(items).subscribe(realm.rx.delete())
        
        
        
        
    }
}
