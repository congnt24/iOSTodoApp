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
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print("isHidden \(enableSwitch)")
    }
 */

}
