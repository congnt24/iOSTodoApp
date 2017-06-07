//
//  FieldView.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class FieldView: UIView {

    @IBOutlet var fieldView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textField: AwesomeTextField!

    @IBInspectable var myImage: UIImage {
        get {
            return image.image!
        }

        set(myImage) {
            image.image = myImage
        }
    }

    @IBInspectable var placeHolder: String {
        get {
            return textField.placeholder!
        }
        set(placeHolder) {
            textField.placeholder = placeHolder
        }
    }
    
    @IBInspectable var enableDatePicker: Bool = false {
        didSet {
            textField.enableDatePicker = true
        }
    }
    
    @IBInspectable var enableTimePicker: Bool = false {
        didSet {
            textField.enableTimePicker = true
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "FieldView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(fieldView)
        fieldView.frame = self.bounds
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

}
