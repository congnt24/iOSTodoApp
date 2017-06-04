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
    @IBOutlet weak var textField: UITextField!
    
    @IBInspectable var myImage: UIImage {
        get {
            return image.image!
        }
        
        set(myImage){
            image.image = myImage
        }
    }
    
    @IBInspectable var placeHolder: String {
        get {
            return textField.placeholder!
        }
        set(placeHolder){
            textField.placeholder = placeHolder
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "FieldView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(fieldView)
        fieldView.frame = self.bounds
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
