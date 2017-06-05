//
//  HomeTableViewCell.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var editView: UIImageView!
    @IBOutlet weak var todoView: ItemToDoView!
    var editViewWidth: CGFloat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        editViewWidth = editView.constraints.filter({$0.firstAttribute == .width}).first?.constant
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func hideEditView(){
        editView.isHidden = true
        editView.constraints.filter({$0.firstAttribute == .width}).first?.constant = 0
    }
    
    func showEditView(){
        editView.isHidden = false
        editView.constraints.filter({$0.firstAttribute == .width}).first?.constant = editViewWidth!
    }
    
}
