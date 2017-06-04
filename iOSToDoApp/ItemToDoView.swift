//
//  ItemToDoView.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ItemToDoView: UITableViewCell {

    @IBOutlet var view: UIView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var timeView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    
    @IBInspectable var title: String? {
        get {
            return titleView.text
        }
        set(title){
            titleView.text = title
        }
    }
    @IBInspectable var time: String? {
        get {
            return timeView.text
        }
        set(time){
            timeView.text = time
        }
    }
    @IBInspectable var desc: String? {
        get {
            return descriptionView.text
        }
        set(desc){
            descriptionView.text = desc
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "ItemToDoView", bundle: nil).instantiate(withOwner: self, options: nil)
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
