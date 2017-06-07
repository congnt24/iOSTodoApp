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

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var uiSwitch: UISwitch!

    @IBInspectable var title: String? {
        get {
            return label_title.text
        }
        set(title) {
            label_title.text = title
        }
    }

    @IBInspectable var placeHolder: String? {
        get {
            return tfValue.placeholder
        }
        set(value) {
            tfValue.placeholder = value
            uiSwitch.isHidden = true
        }
    }
    @IBInspectable var enableSwitch: Bool {
        get {
            return uiSwitch.isHidden
        }
        set(isHidden) {
            uiSwitch.isHidden = !isHidden
            if isHidden {
                tfValue.isHidden = true
            }
        }
    }

    @IBInspectable var enableDatePicker: Bool {
        get {
            return true
        }
        set(value) {
            setupDatePicker()
        }
    }

    @IBOutlet var view: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "ItemPickerView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        let tap = UITapGestureRecognizer(target: self, action: #selector(showInputDialog))
        view.addGestureRecognizer(tap)
    }

    var comp: ((String) -> Void)?

    func showInputDialog() {
        if !enableSwitch {
            uiSwitch.isOn = !uiSwitch.isOn
        } else {
//            viewController?.showInputDialog(title!, defaultText: value, label: label_value, onCompletion: comp)
            tfValue.becomeFirstResponder()
        }
    }

    func setupDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(onDateChange(sender:)), for: UIControlEvents.valueChanged)
        tfValue.inputView = datePicker
    }

    func onDateChange(sender: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.setLocalizedDateFormatFromTemplate("yMMMMd")
        tfValue.text = dateFormater.string(from: sender.date)
    }

}
