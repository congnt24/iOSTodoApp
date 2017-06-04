//
//  ItemNavView.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ItemNavView: UIView {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_count: UILabel!
    
    @IBInspectable var myIcon: UIImage? {
        get {
            return icon.image
        }
        set(myIcon){
            icon.image = myIcon
        }
    }
    
    @IBInspectable var labelName: String? {
        get {
            return label_name.text
        }
        set(labelName){
            label_name.text = labelName
        }
    }
    @IBInspectable var labelCount: String? {
        get {
            return label_count.text
        }
        set(labelCount){
            label_count.text = labelCount
        }
    }
    
    @IBOutlet var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "ItemNavView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
