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
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
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
        btnClose.rx.tap.subscribe(onNext: {
            self.navigationController?.popViewController(animated: true)
        }).addDisposableTo(bag)
        btnDone.rx.tap.bind(to: viewModel.tapDone).addDisposableTo(bag)
        
    }
    
    func setupRx(){
        labelDesc.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddNewViewController.showDialogDesc)))
        labelTitle.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddNewViewController.showDialogTitle)))
        itemDate.comp = { self.viewModel.date = $0 }
    }
    
    func showDialogTitle(){
        showInputDialog("Title", label: labelTitle){
            self.viewModel.title = $0
        }
    }
    func showDialogDesc(){
        showInputDialog("Description", label: labelDesc) {
            self.viewModel.desc = $0
        }
    }
}
