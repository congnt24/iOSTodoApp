//
//  AwesomeTextField.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

enum DateFormatType: String {
    case Date = "yMMMMd"
    case Time = "hh:mm"
}

@IBDesignable
class AwesomeTextField: UITextField {

    @IBInspectable var enableDatePicker: Bool = false {
        didSet{
            setupDatePicker()
        }
    }
    @IBInspectable var enableTimePicker: Bool = false {
        didSet{
            setupDatePicker()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //MARK: - setup view
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //TODO: some default layout setting define here
    }
    
    func setupDatePicker(){
        if enableDatePicker || enableTimePicker {
            let datePicker = UIDatePicker()
            //setup mode
            if enableDatePicker && enableTimePicker {
                datePicker.datePickerMode = .dateAndTime
            } else if enableDatePicker {
                datePicker.datePickerMode = .date
            } else if enableTimePicker {
                datePicker.datePickerMode = .time
            }
            datePicker.addTarget(self, action: #selector(onDateChange(sender:)), for: .valueChanged)
            self.text = formatDate(mode: datePicker.datePickerMode, date: Date())

            self.inputView = datePicker
        }
    }
    
    func onDateChange(sender: UIDatePicker) {
        self.text = formatDate(mode: sender.datePickerMode, date: sender.date)
    }
    
    
    func formatDate(mode: UIDatePickerMode, date: Date) -> String {
        let dateFormater = DateFormatter()
        var format: DateFormatType {
            switch mode {
            case .time:
                return .Time
            default:
                return .Date
            }
        }
        dateFormater.setLocalizedDateFormatFromTemplate(format.rawValue)
        return dateFormater.string(from: date)
    }
}
