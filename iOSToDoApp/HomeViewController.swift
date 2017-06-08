//
//  HomeViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var itemNavigation: UINavigationItem!
    @IBOutlet weak var rightBar: UIBarButtonItem!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    //date for table view
    var viewModel: HomeViewModel!
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.setEditing(false, animated: true)
        //for clearing selected when appear
        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
    
    func setupNav(){
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.setLocalizedDateFormatFromTemplate("yMMMMd")
        let dateStr = dateFormater.string(from: date)
        //        dateFormater.weekdaySymbols
        let day = dateFormater.weekdaySymbols[Calendar.current.component(.weekday, from: date)]
        lblDate.text = dateStr
        lblDay.text = day//DateFormatter().monthSymbols[month - 1]
        //goodmorning
        let hour = Calendar.current.component(.hour, from: date)
        
        if case 0...11 = hour {
            self.title = "Good Morning"
        } else if case 11...18 = hour {
            self.title = "Good Afternoon"
        } else {
            self.title = "Good Evening"
        }
        itemNavigation.title = title
        
    }

    func editing() {
        tableView.isEditing = !tableView.isEditing
    }
    func setupTableView() {
        tableView.estimatedRowHeight = 56.0
        tableView.rowHeight = UITableViewAutomaticDimension
        //setup editmode
        rightBar.action = #selector(HomeViewController.editing)
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "home_cell")
        tableView.backgroundColor = UIColor.clear
        //bind data to tableview
        viewModel.datas.asObservable().bind(to: tableView.rx.items(cellIdentifier: "home_cell")) { (index, model, cell: HomeTableViewCell) in
            cell.backgroundColor = UIColor.clear
            cell.todoView.title = model.title
            cell.todoView.descriptionView.text = model.desc
            cell.todoView.timeView.text = model.time
        }.addDisposableTo(bag)
        tableView.separatorStyle = .none
        //delegate for tableview
        tableView.rx.itemDeleted.bind(to: viewModel.deleteItem).addDisposableTo(bag)
        tableView.rx.setDelegate(self).addDisposableTo(bag)
        tableView.rx.itemSelected.bind(to: viewModel.selectedItem).addDisposableTo(bag)
        btnAdd.rx.tap.bind(to: viewModel.addNew).addDisposableTo(bag)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }

    func configureDataSource() {

        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, TodoModel>>()
        dataSource.configureCell = { ds, tv, ip, model in
            let cell = tv.dequeueReusableCell(withIdentifier: "home_cell") as! HomeTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.todoView.title = model.title
            cell.todoView.descriptionView.text = model.desc
            cell.todoView.timeView.text = model.time
            return cell
        }
        dataSource.canEditRowAtIndexPath = { (ds, ip) in
            return true
        }

        viewModel.datas.asObservable().flatMap({ // (todo) -> Observable<[SectionModel<String, [TodoModel]>]> in
            Observable.just([SectionModel(model: "", items: $0)])
        }).bind(to: tableView.rx.items(dataSource: dataSource)).addDisposableTo(bag)
    }

}
