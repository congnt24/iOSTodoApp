//
//  ItemPickerView.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ItemPickerView: UIView {


    @IBOutlet weak var label_title: UILabel!

    @IBOutlet weak var label_value: UILabel!
    @IBOutlet weak var uiSwitch: UISwitch!

    @IBInspectable var title: String? {
        get {
            return label_title.text
        }
        set(title) {
            label_title.text = title
        }
    }

    @IBInspectable var value: String? {
        get {
            return label_value.text
        }
        set(value) {
            label_value.text = value
        }
    }
    @IBInspectable var enableSwitch: Bool {
        get {
            return uiSwitch.isHidden
        }
        set(isHidden){
            uiSwitch.isHidden = isHidden
        }
    }

    @IBOutlet var view: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "ItemPickerView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showInputDialog(_:)))
        view.addGestureRecognizer(tap)
//        view.perform(#selector("showInputDialog:"))//error
    }
    
    
    func showInputDialog(_ sender: UITapGestureRecognizer){
        let dialog = UIAlertController(title: "\(title!)", message: "Please enter \(title!)", preferredStyle: .alert)
        dialog.addTextField { (textField) in
            textField.placeholder = "\(self.title!)"
        }
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            self.value = dialog.textFields?[0].text
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        dialog.addAction(ok)
        dialog.addAction(cancel)
        viewController?.present(dialog, animated: true, completion: nil)
    }

}
