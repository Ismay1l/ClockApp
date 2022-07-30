//
//  WorldClockController.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 22.07.22.
//

import UIKit
import SnapKit

struct Timer {
    var name: String
    var time: String
}

class WorldClockController: UIViewController {
    
    //MARK: Variables
    
    var countryNameArray = [String]()
    var timeArray = [String]()
    
    let clView = CountriesListView()

    
//    let wc = CountriesListView()
    
    let cellIdentifier = "cell"
    
    var model = [
        Timer(name: "Baku, Azerbaijan", time: "5:11 AM"),
        Timer(name: "Tbilisi, Georgia", time: "5:11 AM"),
        Timer(name: "Ankara, Turkey", time: "4:11 AM"),
        Timer(name: "Istanbul, Turkey", time: "4:11 AM"),
        Timer(name: "Milan, Italy", time: "3:11 AM"),
        Timer(name: "Turin, Italy", time: "3:11 AM"),
        Timer(name: "Verona, Italy", time: "3:11 AM"),
        Timer(name: "Venice, Italy", time: "3:11 AM"),
        Timer(name: "Barcelona, Spain", time: "3:11 AM"),
        Timer(name: "Valencia, Spain", time: "3:11 AM"),
        Timer(name: "Brussels, Belgium", time: "3:11 AM"),
        Timer(name: "Amsterdam, The Netherlands", time: "3:11 AM"),
        Timer(name: "Paris, France", time: "3:11 AM"),
        Timer(name: "Lyon, France", time: "3:11 AM"),
    ]
    
    //MARK: UI Components
    
    private lazy var mainTableView: UITableView = {
        let view = UITableView()
        view.register(MainTableViewCell.self,
                      forCellReuseIdentifier: self.cellIdentifier)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .black
        view.separatorStyle = .singleLine
        return view
    }()

    //MARK: Parent Delegates
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        clView.delegate = self
        print("Viewdidload")
        
        self.view.addSubview(self.mainTableView)

        let editButton = UIBarButtonItem(title: "Edit",
                                         style: .plain,
                                         target: self,
                                         action: nil)
        
        editButton.tintColor = .systemYellow
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(onAdd))
        
        addButton.tintColor = .systemYellow
        
        self.navigationItem.leftBarButtonItem = editButton
        self.navigationItem.rightBarButtonItem = addButton
        
        self.mainTableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {

        print("Viewwillappear")
        clView.delegate = self
    }
    

    
    @objc func getTime() {
        
    }
    
    @objc func onAdd() {
//        let navVC = UINavigationController(rootViewController: clView)
//        navVC.modalPresentationStyle = .popover
//        navVC.modalTransitionStyle = .coverVertical
//        clView.modalPresentationStyle = .popover
        self.navigationController?.pushViewController(clView, animated: true)
//        present(navVC, animated: true)
    }
}

extension WorldClockController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(countryNameArray.count)
        return self.countryNameArray.count
//        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as! MainTableViewCell
        cell.nameLabel.text = self.countryNameArray[indexPath.row]
        cell.timeLabel.text = self.timeArray[indexPath.row]
//        cell.setupTable(name: model[indexPath.row].name, time: model[indexPath.row].time)
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
//            model.remove(at: indexPath.row)
            countryNameArray.remove(at: indexPath.row)
            timeArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

extension WorldClockController: CountriesListViewDelegate {
    func getData(name: String, time: String) {
        print(name)
        self.countryNameArray.append(name)
        self.timeArray.append(time)
        self.mainTableView.reloadData()
    }
}


