//
//  AlarmViewController.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 22.07.22.
//

import UIKit

class AlarmViewController: UIViewController {
    
    //MARK: UI Components
    
    private lazy var sleepWakeUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sleep|Wake Up"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private lazy var bedIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "bed_white"))
        return icon
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.view.addSubview(sleepWakeUpLabel)
        self.view.addSubview(bedIcon)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(onAdd))
        
        addButton.tintColor = .systemYellow
        
        self.navigationItem.rightBarButtonItem = addButton
        
        sleepWakeUpLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(bedIcon.snp.right).offset(4)
        }
        
        bedIcon.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(5)
        }
    }
    
    @objc func onAdd() {
        let vc = SettingAlarmViewController()
        let navWC = UINavigationController(rootViewController: vc)
        navWC.modalPresentationStyle = .popover
        navWC.modalTransitionStyle = .coverVertical
        present(navWC, animated: true)
    }
}
