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
        print("on did load")
        let date = Date()
        let dateFormater = DateFormatter()
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "en_US")
        dateFormater.locale = Locale(identifier: "en_US")
        dateFormater.setLocalizedDateFormatFromTemplate("MMMMd")
        let dateStr = dateFormater.string(from: date)
        let month = dateFormater.calendar.component(.month, from: date)
        lblDate.text = dateStr
        lblDay.text = DateFormatter().monthSymbols[month - 1]
        btnAdd.rx.tap.bind(to: viewModel.addNew).addDisposableTo(bag)
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.setEditing(false, animated: true)
    }

    func aa() {
        tableView.isEditing = !tableView.isEditing
    }
    func setupTableView() {
        tableView.estimatedRowHeight = 56.0
        tableView.rowHeight = UITableViewAutomaticDimension
        //setup editmode
        rightBar.action = #selector(HomeViewController.aa)
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "home_cell")
        tableView.backgroundColor = UIColor.clear
        viewModel.datas.asObservable().bind(to: tableView.rx.items(cellIdentifier: "home_cell")) { (index, model, cell: HomeTableViewCell) in
            cell.backgroundColor = UIColor.clear
            cell.todoView.title = model.title
            cell.todoView.descriptionView.text = model.desc
            cell.todoView.timeView.text = model.time
            cell.hideEditView()
        }.addDisposableTo(bag)
        tableView.separatorStyle = .none
        tableView.rx.itemDeleted.bind(to: viewModel.deleteItem).addDisposableTo(bag)

        tableView.rx
            .setDelegate(self)
            .addDisposableTo(bag)

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
            //editting
            //            if(self.tableView.isEditing) {
            //                cell.showEditView()
            //            } else {
            cell.hideEditView()
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
