//
//  NavViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NavViewController: UIViewController {

    @IBOutlet weak var btnSignout: UIBarButtonItem!
    @IBOutlet weak var btnClose: UIBarButtonItem!
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSignout.rx.tap.subscribe(onNext: {
            UserDefaultHandler.isLogged = false
            self.navigationController?.popToRootViewController(animated: true)
        }).addDisposableTo(bag)
        btnClose.rx.tap.subscribe(onNext: {
            self.navigationController?.popViewController(animated: true)
        }).addDisposableTo(bag)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
