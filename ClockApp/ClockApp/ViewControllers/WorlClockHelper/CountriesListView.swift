//
//  CountriesListView.swift
//  ClockApp
//
//  Created by Ismayil Ismayilov on 23.07.22.
//

import UIKit

protocol CountriesListViewDelegate {
    func getData(name: String, time: String)
}

class CountriesListView: UIViewController {
    
    //MARK: Variables
    
    var delegate: CountriesListViewDelegate?
    
    
    let alphabet = "abcdefghijklmnopqrstvuwxyz"
    
    var models = [Group]()
    
    let cellIdentifier = "cell"
    
    let countries: [String: [String]] = [
        "A": ["Abu Dhabi, United Arab Emirates", "Abuja, Nigeria",
              "Accra, Ghana",
             "Adamstown, Pitcairn Islands",
            "Addis Ababa, Ethiopia",
              "Aden, Yemen",
              "Algiers, Algeria",
             "Alofi, Niue",
             "Amman, Jordan",
             "Amsterdam, Netherlands",
             "Andorra la Vella, Andorra",
             "Ankara, Turkey",
              "Antananarivo, Madagascar",
              "Apia, Samoa",
             "Ashgabat, Turkmenistan",
              "Asmara, Eritrea",
              "Asunción, Paragua",
              "Athens, Greece",
              "Avarua, Cook Islands"],
        
        "B": ["Baghdad, Iraq",
              "Baku, Azerbaijan",
             "Bamako, Mali",
              "Bandar Seri Begawan, Brunei",
              "Bangkok, Thailand",
              "Bangui, Central African Republic",
              "Banjul, The Gambia",
              "Basseterre, Saint Kitts and Nevis",
             " Beijing, China"],
        
        "C": ["Cape Town, South Africa",
              "Cairo, Egypt",
             "Canberra, Australia",
             "Caracas, Venezuela",
              "Castries, Saint Lucia"],
        
        "D": ["Dakar, Senegal",
              "Damascus, Syria",
             "Dar es Salaam, Tanzania",
              "Dodoma, Bangladesh",
             "Dili, East Timor",
             "Djibouti, Djibouti",
              "Doha, Qatar",
              "Douglas, Isle of Man",
              "Dublin, Ireland"],
        
        "F": ["Flying Fish Cove, Christmas Island",
              "Freetown, Sierra Leone",
              "Funafuti, Tuvalu"],
        
        "G": ["Gaborone, Botswana",
             "George Town, Cayman Islands",
              "Georgetown, Ascension Island",
              "Georgetown, Guyana",
              "Gibraltar, Gibraltar"],
        
        "L": ["Libreville, Gabon",
              "Lilongwe, Malawi",
              "Lima, Peru",
              "Lisbon, Portugal"],
        
        "M": ["Mariehamn, Åland Islands",
              "Marigot, Saint Martin",
              "Maseru, Lesotho",
              "Mata Utu, Wallis and Futuna",
              "Mexico City, Mexico",
              "Minsk, Belarus"],
        
        "P": ["Panama City, Panama",
              "Papeete, French Polynesia",
              "Paramaribo, Suriname",
              "Parism France"],
        
        "R": ["Reykjavík, Iceland",
              "Riga, Latvia",
              "Riyadh, Saudi Arabia",
              "Road Town, British Virgin Islands",
              "Rome, Italy"],
    ]
    
    //MARK: UI Components
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose a City"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var mainTableView: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self,
                      forCellReuseIdentifier: self.cellIdentifier)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .systemGray5
        view.separatorStyle = .singleLine
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.systemYellow, for: .normal)
        button.addTarget(self,
                         action: #selector(onCancel),
                         for: .touchUpInside)
        return button
    }()
    
    //MARK: Parent Delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray5
        
        self.view.addSubview(headerLabel)
        self.view.addSubview(mainTableView)
        self.view.addSubview(cancelButton)
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.bottom).offset(10)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.snp.top).offset(10)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-8)
        }
        
        self.setUpData()
    }
    
    //MARK: Functions
    
    func setUpData() {
        for (key, value) in countries {
            models.append(.init(title: key, countries: value))
        }
        models = models.sorted(by: { $0.title < $1.title})
    }
    
    @objc func onCancel() {
        dismiss(animated: true)
    }
}

//MARK: Extension

extension CountriesListView: UITableViewDataSource,
                             UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.models[section].countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier)
        cell?.textLabel?.text = self.models[indexPath.section].countries[indexPath.row]
        cell?.selectionStyle = .none
        cell?.backgroundColor = .systemGray5
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        models[section].title
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        Array(alphabet.uppercased()).compactMap { character in
            "\(character)"
        }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let targetIndex = models.firstIndex(where: { group in
            group.title == title
        }) else {
            return 0
        }
        
        return targetIndex
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("ttt: \(models[indexPath.section].countries[indexPath.row])")
        delegate?.getData(name: models[indexPath.section].countries[indexPath.row],
                          time: "11:11AM")
        dismiss(animated: true)
//        let wc = WorldClockController()
//        self.navigationController?.pushViewController(wc, animated: true)
    }
}

struct Group {
    var title: String
    var countries: [String]
}
