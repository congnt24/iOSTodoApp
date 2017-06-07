//
//  AddNewViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddNewViewController: UIViewController {

    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var btnClose: UIBarButtonItem!
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDesc: UITextField!
    @IBOutlet weak var itemDate: ItemPickerView!
    
    @IBOutlet weak var itemTime: ItemPickerView!
    
    @IBOutlet weak var itemAllDay: ItemPickerView!
    
    @IBOutlet weak var itemLocation: ItemPickerView!
    
    @IBOutlet weak var itemNotification: ItemPickerView!
    @IBOutlet weak var itemPeople: ItemPickerView!
    
    @IBOutlet weak var itemRepeat: ItemPickerView!
    
    
    var viewModel: AddNewViewModel!

    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupRx()
        
    }
    
    func setupRx(){
        //bind textfield to viewmodel
        //input
        btnClose.rx.tap.subscribe(onNext: {
            self.navigationController?.popViewController(animated: true)
        }).addDisposableTo(bag)
        tfTitle.rx.text.bind(to: viewModel.title).addDisposableTo(bag)
        tfDesc.rx.text.bind(to: viewModel.desc).addDisposableTo(bag)
        btnDone.rx.tap.bind(to: viewModel.tapDone).addDisposableTo(bag)
        
        
        //output
        viewModel.canDone.drive(onNext: {
            self.btnDone.isEnabled = $0
        }).addDisposableTo(bag)
    }
}
